import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/core/network/network_info.dart';
import 'package:posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:posts_app/features/posts/data/repositories/post_repository_impl.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post_usecase.dart';
import 'package:posts_app/features/posts/presentation/provider/posts_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - posts

  // Provider
  sl.registerFactory(
    () => PostsProvider(
        getAllPostsUsecase: sl(),
        addPostUsecase: sl(),
        updatePostUsecase: sl(),
        deletePostUsecase: sl()),
  );

  // Usecases
  sl.registerLazySingleton(
    () => GetAllPostsUsecase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => AddPostUsecase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => UpdatePostUsecase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => DeletePostUsecase(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // Datasources

  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<PostLocalDataSource>(
    () => PostLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(
    () => sharedPreferences,
  );

  sl.registerLazySingleton(
    () => http.Client(),
  );

  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
}
