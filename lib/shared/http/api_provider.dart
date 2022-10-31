// ignore_for_file: avoid_dynamic_calls, avoid_catching_errors, strict_raw_type,
// inference_failure_on_function_invocation

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../repository/token_repository.dart';
import 'api_exception.dart';
import 'api_response.dart';
import 'interceptor/dio_connectivity_request_retrier.dart';
import 'interceptor/retry_interceptor.dart';

enum ContentType { urlEncoded, json }

final apiProvider = Provider<ApiProvider>(
  ApiProvider.new,
);

class ApiProvider {
  ApiProvider(this._reader) {
    _dio = Dio();
    _dio.options.sendTimeout = 30000;
    _dio.options.connectTimeout = 30000;
    _dio.options.receiveTimeout = 30000;
    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: _dio,
          connectivity: Connectivity(),
        ),
      ),
    );

    _dio.httpClientAdapter = DefaultHttpClientAdapter();

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return null;
    };

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }

    if (dotenv.env['BASE_URL'] != null) {
      _baseUrl = dotenv.env['BASE_URL']!;
    }
  }

  final Ref _reader;

  late Dio _dio;

  late final TokenRepository _tokenRepository =
      _reader.read(tokenRepositoryProvider);

  late String _baseUrl;

  // ignore: long-parameter-list
  Future<APIResponse<dynamic>> post(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
    ContentType contentType = ContentType.json,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(ApiException.connectivity());
    }
    String url;
    url = newBaseUrl != null ? newBaseUrl + path : _baseUrl + path;
    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json';
    }

    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
      };
      final _appToken = await _tokenRepository.fetchToken();
      if (_appToken != null) {
        headers['Authorization'] = 'Bearer $_appToken';
      }

      /// Sometime for some specific endpoint
      /// it may require to use different Token
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await _dio.post<dynamic>(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(ApiException.connectivity());
      }

      if (response.statusCode! < 300) {
        return APIResponse.success(response.data);
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(ApiException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return const APIResponse.error(ApiException.unathorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(ApiException.error());
        } else {
          return response.data['message'] != null
              ? APIResponse.error(
                  ApiException.errorWithMessage(
                    response.data['message'] as String,
                  ),
                )
              : const APIResponse.error(ApiException.error());
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(ApiException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(ApiException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(
            ApiException.errorWithMessage(
              e.response!.data['message'] as String,
            ),
          );
        }
      }

      return APIResponse.error(ApiException.errorWithMessage(e.message));
    } on Error catch (e) {
      return APIResponse.error(
        ApiException.errorWithMessage(e.stackTrace.toString()),
      );
    }
  }

  // ignore: long-parameter-list
  Future<APIResponse> get(
    String path, {
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
    ContentType contentType = ContentType.json,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(ApiException.connectivity());
    }
    String url;
    url = newBaseUrl != null ? newBaseUrl + path : _baseUrl + path;

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final _appToken = await _tokenRepository.fetchToken();
    if (_appToken != null) {
      headers['Authorization'] = 'Bearer $_appToken';
    }

    try {
      final response = await _dio.get<dynamic>(
        url,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );
      if (response.statusCode == null) {
        return const APIResponse.error(ApiException.connectivity());
      }

      if (response.statusCode! < 300) {
        return APIResponse.success(response.data);
      } else {
        if (response.statusCode! == 404) {
          return const APIResponse.error(ApiException.connectivity());
        } else if (response.statusCode! == 401) {
          return const APIResponse.error(ApiException.unathorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(ApiException.error());
        } else {
          return response.data['error'] != null
              ? APIResponse.error(
                  ApiException.errorWithMessage(
                    response.data['error'] as String,
                  ),
                )
              : const APIResponse.error(ApiException.error());
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(ApiException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(ApiException.connectivity());
      }

      return const APIResponse.error(ApiException.error());
    }
  }

  // ignore: long-parameter-list
  Future<APIResponse> put(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
    ContentType contentType = ContentType.json,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(ApiException.connectivity());
    }
    String url;
    url = newBaseUrl != null ? newBaseUrl + path : _baseUrl + path;

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final _appToken = await _tokenRepository.fetchToken();
    if (_appToken != null) {
      headers['Authorization'] = 'Bearer $_appToken';
    }

    try {
      final response = await _dio.put<dynamic>(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );
      if (response.statusCode == null) {
        return const APIResponse.error(ApiException.connectivity());
      }

      if (response.statusCode! < 300) {
        return APIResponse.success(response.data);
      } else {
        if (response.statusCode! == 404) {
          return const APIResponse.error(ApiException.connectivity());
        } else if (response.statusCode! == 401) {
          return const APIResponse.error(ApiException.unathorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(ApiException.error());
        } else {
          return response.data['error'] != null
              ? APIResponse.error(
                  ApiException.errorWithMessage(
                    response.data['error'] as String,
                  ),
                )
              : const APIResponse.error(ApiException.error());
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(ApiException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(ApiException.connectivity());
      }

      return const APIResponse.error(ApiException.error());
    }
  }
}
