
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sekebit/pages/homePage.dart';
import 'package:sekebit/pages/settingPage.dart';
import 'pages/secoundPage.dart';

void main() {
  runApp(const MyApp());
}
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return  HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'setting',
          builder: (BuildContext context, GoRouterState state) {
            return  SettingPage();
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
      title: 'SekeBit',
    
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
