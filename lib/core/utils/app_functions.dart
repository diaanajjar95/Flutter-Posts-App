import 'package:go_router/go_router.dart';

void appNavigatePush(context, String path) {
  GoRouter.of(context).push(path);
}


void appNavigatePushReplacement(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
