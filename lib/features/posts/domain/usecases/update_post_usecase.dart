import 'package:dartz/dartz.dart';
import 'package:posts_app/core/errors/failures.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';

class UpdatePostUsecase {
  final PostRepository repository;

  UpdatePostUsecase({required this.repository});

  Future<Either<Failure, Unit>> call(PostEntity post) async {
    return await repository.updatePost(post);
  }
}
