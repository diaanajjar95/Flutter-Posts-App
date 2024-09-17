import 'package:dartz/dartz.dart';
import 'package:posts_app/core/errors/failures.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure,List<PostEntity>>> getAllPosts();
  Future<Either<Failure,Unit>> deletePost(int id);
  Future<Either<Failure,Unit>> updatePost(PostEntity post);
  Future<Either<Failure,Unit>> addPost(PostEntity post);
}
