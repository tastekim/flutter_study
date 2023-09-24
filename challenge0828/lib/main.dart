import 'package:challenge0828/util/size.dart';
import 'package:challenge0828/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig(context);

    // final GoRouter router = GoRouter(
    //   routes: [
    //     GoRoute(
    //       path: '/',
    //       builder: (BuildContext context, GoRouterState state) =>
    //           PostPage(size: size),
    //     ),
    //     GoRoute(
    //       path: '/search',
    //       builder: (context, state) => const SearchPage(),
    //     ),
    //     GoRoute(
    //       path: '/noti',
    //       builder: (context, state) => const NotificatePage(),
    //     ),
    //     GoRoute(
    //       path: '/profile',
    //       builder: (context, state) => const ProfilePage(),
    //     ),
    //   ],
    // );
    

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorDark: Colors.white,
        primaryColor: Colors.black,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      // routerConfig: router,
      home: const Home(),
    );
  }
}
