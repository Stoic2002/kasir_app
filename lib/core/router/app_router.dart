import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';
import 'package:kasir_app/features/auth/presentetion/pages/login_page.dart';
import 'package:kasir_app/features/auth/presentetion/pages/register_page.dart';
import 'package:kasir_app/features/auth/presentetion/pages/splash_screen_page.dart';
import 'package:kasir_app/features/home/presentetion/pages/main_navigation.dart';

part 'enums/root_tab.dart';
part 'models/path_parameters.dart';

class AppRouter {
  final router = GoRouter(
      initialLocation: RouteConstants.splashPath,
      routes: [
        GoRoute(
          path: RouteConstants.splashPath,
          name: RouteConstants.splash,
          builder: (context, state) => const SplashScreenPage(),
        ),
        GoRoute(
          name: RouteConstants.login,
          path: RouteConstants.loginPath,
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              name: RouteConstants.register,
              path: RouteConstants.registerPath,
              builder: (context, state) => const RegisterPage(),
            ),
          ],
        ),
        GoRoute(
            name: RouteConstants.root,
            path: RouteConstants.rootPath,
            builder: (context, state) {
              final tab =
                  int.tryParse(state.pathParameters[':root_tab'] ?? '') ?? 0;
              return BasicMainNavigationView(
                key: state.pageKey,
                currentTab: tab,
              );
            },
            routes: [])
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Text(
                state.error.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      });
}
