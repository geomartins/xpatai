import 'package:flutter/material.dart';
class PageNotFound extends StatelessWidget {
  static const String id = '/page_not_found';
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Not Found Screen'),
      ),
    );
  }
}
