import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/Application.dart';
import '/router/app_router.gr.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final AppRouter appRouter = ref.watch(appRouterProvider);
        application.appRouter = appRouter;
        return MaterialApp.router(
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
        );
      },
    );
  }
}
