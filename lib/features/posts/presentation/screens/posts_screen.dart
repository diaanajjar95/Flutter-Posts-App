import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/presentation/provider/posts_provider.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   final provider = Provider.of<PostsProvider>(context);

  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Posts')),
  //     body: provider.isLoading
  //         ? const Center(child: CircularProgressIndicator())
  //         : provider.errorMessage != null
  //             ? Center(child: Text(provider.errorMessage!))
  //             : ListView.builder(
  //                 itemCount: provider.posts.length,
  //                 itemBuilder: (context, index) {
  //                   final post = provider.posts[index];
  //                   return ListTile(
  //                     title: Text(post.title),
  //                     subtitle: Text(post.body),
  //                   );
  //                 },
  //               ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: FutureBuilder(
        future: Provider.of<PostsProvider>(context, listen: false).loadPosts(),
        builder: (context, snapshot) {
          final provider = Provider.of<PostsProvider>(context);

          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          return ListView.builder(
            itemCount: provider.posts.length,
            itemBuilder: (context, index) {
              final post = provider.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        },
      ),
    );
  }
}
