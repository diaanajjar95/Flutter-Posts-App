import 'package:dartz/dartz.dart';
import 'package:posts_app/core/errors/failures.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';

class GetAllPostsUsecase {
  final PostRepository repository;

  GetAllPostsUsecase({required this.repository});

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await repository.getAllPosts();
  }
}
