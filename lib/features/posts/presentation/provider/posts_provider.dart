import 'package:flutter/foundation.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post_usecase.dart';

class PostsProvider with ChangeNotifier {
  final GetAllPostsUsecase getAllPostsUsecase;
  final AddPostUsecase addPostUsecase;
  final UpdatePostUsecase updatePostUsecase;
  final DeletePostUsecase deletePostUsecase;

  List<PostEntity> _posts = [];
  bool isLoading = true;
  String? errorMessage;

  List<PostEntity> get posts => _posts;

  PostsProvider({
    required this.getAllPostsUsecase,
    required this.addPostUsecase,
    required this.updatePostUsecase,
    required this.deletePostUsecase,
  });

  Future<void> loadPosts() async {
    isLoading = true;
    notifyListeners();

    final result = await getAllPostsUsecase();
    result.fold(
      (failure) {
        errorMessage = 'Failed to load posts';
        isLoading = false;
        notifyListeners();
      },
      (postsList) {
        _posts = postsList;
        isLoading = false;
        notifyListeners();
      },
    );
  }

  // void addPost(String title) {
  //   final newTask = Task(id: DateTime.now().toString(), title: title);
  //   addTaskUseCase(newTask);
  //   loadTasks();
  // }
}
