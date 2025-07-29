import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'detail_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostListPage extends StatefulWidget {
  final String url;
  const PostListPage({super.key, required this.url});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  late Future<List<PostModel>> _postsFuture;

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(widget.url));
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => PostModel.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>>(
      future: _postsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final posts = snapshot.data!;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
              title: Text(post.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PostDetailPage(post: post)),
                );
              },
            );
          },
        );
      },
    );
  }
}
