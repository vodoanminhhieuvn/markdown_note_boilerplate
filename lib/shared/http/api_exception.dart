import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
class ApiException with _$ApiException {
  const factory ApiException.connectivity() = ApiExceptionConnectivity;

  const factory ApiException.unathorized() = ApiExceptionUnauthorized;

  const factory ApiException.errorWithMessage(String message) =
      _ApiExceptionErrorMessage;

  const factory ApiException.error() = _ApiExceptionError;
}
