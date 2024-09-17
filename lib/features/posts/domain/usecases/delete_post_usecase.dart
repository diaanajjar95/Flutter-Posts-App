import 'package:dartz/dartz.dart';
import 'package:posts_app/core/errors/failures.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';

class DeletePostUsecase {
  final PostRepository repository;

  DeletePostUsecase({required this.repository});

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}
