import 'package:cubitexample/pages/coinsScreen.dart';
import 'package:cubitexample/pages/firstPage.dart';
import 'package:cubitexample/pages/hookScreen.dart';
import 'package:cubitexample/stateManage/coins_cubit.dart';
import 'package:cubitexample/stateManage/counter_cubit.dart';
import 'package:cubitexample/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'pages/secoundPage.dart';

void main() {
  runApp(const MyApp());
}
final GoRouter _router = GoRouter(
  initialLocation: '/hook',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return  CubitCounter();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'second',
          builder: (BuildContext context, GoRouterState state) {
            return  SecondPage();
          },
        ),
        GoRoute(
          path: 'hook',
          builder: (BuildContext context, GoRouterState state) {
            return const HookScreen();
          },
        ),
        GoRoute(
          path: 'coins',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (_) => CoinsCubit(),
                child:  CoinScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig:_router,
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      title: 'cubit test',
    
      theme: ThemeData(
        primarySwatch: Colors.red,
         textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(color: Colors.black , fontSize: 24),
        ),
      ),
    );
  }
}
