# post_sdk

A simple Flutter SDK to show a list of posts and details fetched from a public API.

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:post_sdk/post_sdk.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(url: 'https://jsonplaceholder.typicode.com/posts'),
    );
  }
}
```
