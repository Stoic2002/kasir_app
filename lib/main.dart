import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:kasir_app/core/router/app_router.dart';
import 'package:kasir_app/features/auth/data/datasources/auth_method.dart';
import 'package:kasir_app/features/auth/presentetion/bloc/login/login_bloc.dart';
import 'package:kasir_app/features/auth/presentetion/bloc/register/register_bloc.dart';

import 'package:kasir_app/features/history/data/datasources/history_transaction_repository.dart';

import 'package:kasir_app/features/history/presentetion/bloc/transaction/transaction_bloc.dart';
import 'package:kasir_app/features/transaction/data/datasource/order_datasource.dart';
import 'package:kasir_app/features/transaction/presentetion/bloc/checkout/checkout_bloc.dart';
import 'package:kasir_app/features/transaction/presentetion/bloc/order/order_bloc.dart';

import 'package:kasir_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthMethod()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthMethod()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(OrderDatasource()),
        ),
        BlocProvider(
          create: (context) => TransactionBloc(HistoryRepo()),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
