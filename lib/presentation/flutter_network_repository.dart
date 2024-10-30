import 'package:flutter/material.dart';

import '../di/service_locator.dart';
import 'home/home_screen.dart';

class FlutterNetworkRespository extends StatelessWidget {
  const FlutterNetworkRespository({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        homeCubit: getIt(),
      ),
    );
  }
}
