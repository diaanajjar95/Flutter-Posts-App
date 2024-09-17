import 'package:flutter/material.dart';
import 'package:posts_app/core/utils/app_functions.dart';
import 'package:posts_app/core/utils/app_strings.dart';
import 'package:posts_app/core/utils/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    delayThenNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            AppStrings.appName,
            style: AppTextStyles.pacifico400style64,
          ),
        ),
      ),
    );
  }
}

void delayThenNavigate(context) {
  Future.delayed(
    const Duration(seconds: 3),
    () {
      appNavigatePushReplacement(context, '/posts');
    },
  );
}
