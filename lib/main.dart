import 'package:flutter/material.dart';
import 'package:posts_app/core/utils/app_theme.dart';
import 'package:posts_app/core/routes/app_router.dart';
import 'package:posts_app/features/posts/presentation/provider/posts_provider.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.sl<PostsProvider>(),  // Inject PostProvider
        ),
      ],
      child: MaterialApp.router(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
