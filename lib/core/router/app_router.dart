import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/router/router_constants.dart';
import 'package:kasir_app/features/auth/presentetion/pages/login_page.dart';
import 'package:kasir_app/features/auth/presentetion/pages/register_page.dart';
import 'package:kasir_app/features/auth/presentetion/pages/splash_screen_page.dart';
import 'package:kasir_app/features/history/data/models/transaction_model.dart';
import 'package:kasir_app/features/history/presentetion/pages/transaction_page.dart';

import 'package:kasir_app/features/home/data/models/product_new_model.dart';
import 'package:kasir_app/features/home/presentetion/pages/add_product_page.dart';
import 'package:kasir_app/features/home/presentetion/pages/detail_search_product_page.dart';
import 'package:kasir_app/features/home/presentetion/pages/main_navigation.dart';
import 'package:kasir_app/features/home/presentetion/pages/search_product_page.dart';

import 'package:kasir_app/features/transaction/presentetion/pages/product_page.dart';
import 'package:kasir_app/features/transaction/presentetion/pages/yourbag_page.dart';

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
            routes: [
              GoRoute(
                name: RouteConstants.detailProduct,
                path: RouteConstants.detailProductPath,
                builder: (context, state) {
                  ProductNewModel model = state.extra as ProductNewModel;

                  return ProductPage(
                    productModel: model,
                  );
                },
              ),
              GoRoute(
                name: RouteConstants.order,
                path: RouteConstants.orderPath,
                builder: (context, state) {
                  return YourbagPage();
                },
              ),
              GoRoute(
                name: RouteConstants.txDetail,
                path: RouteConstants.txDetailPath,
                builder: (context, state) {
                  TransactionModel model = state.extra as TransactionModel;
                  return TransactionPage(txModel: model);
                },
              ),
              GoRoute(
                  name: RouteConstants.addProduct,
                  path: RouteConstants.addProductPath,
                  builder: (context, state) => const AddProductPage()),
              GoRoute(
                  name: RouteConstants.searchProduct,
                  path: RouteConstants.searchProductPath,
                  builder: (context, state) => const SearchProductPage()),
              GoRoute(
                name: RouteConstants.searchProductDetail,
                path: RouteConstants.searchProductDetailPath,
                builder: (context, state) {
                  ProductNewModel model = state.extra as ProductNewModel;

                  return DetailSearchProductPage(
                    productModel: model,
                  );
                },
              ),
            ])
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
