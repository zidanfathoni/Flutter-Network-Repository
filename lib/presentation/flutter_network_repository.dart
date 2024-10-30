import 'package:flutter/material.dart';

import 'home/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final appContext = navigatorKey.currentState!.context;

class FlutterNetworkRespository extends StatelessWidget {
  const FlutterNetworkRespository({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const HomeScreen(),
    );
  }
}
