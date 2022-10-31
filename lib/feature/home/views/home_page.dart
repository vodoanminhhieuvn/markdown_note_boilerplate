import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/base/base_page.dart';
import '../../../shared/model/user_model/user_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.userInfo});

  final UserModel userInfo;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BasePage<HomePage> {
  String appBarTitle = 'All Notebooks';
  String notebookID = '';

  UserModel get userInfo => widget.userInfo;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('You have logged in!'),
    );
  }
}
