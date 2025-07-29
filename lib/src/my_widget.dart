import 'package:flutter/material.dart';
import 'ui/list_page.dart';

class MyWidget extends StatelessWidget {
  final String url;
  const MyWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post List')),
      body: PostListPage(url: url),
    );
  }
}
