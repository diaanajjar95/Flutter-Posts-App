
import 'package:go_router/go_router.dart';
import 'package:posts_app/features/posts/presentation/screens/posts_screen.dart';
import 'package:posts_app/features/splash/presentation/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/posts",
      builder: (context, state) => const PostsScreen(),
    ),
  ],
);