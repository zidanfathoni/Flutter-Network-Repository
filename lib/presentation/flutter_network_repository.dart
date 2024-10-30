import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final appContext = navigatorKey.currentState!.context;

class FlutterNetworkRespository extends StatelessWidget {
  const FlutterNetworkRespository({super.key});
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
        enabled: true,
        backgroundColor: Colors.white,
        defaultDevice: Devices.ios.iPhone13ProMax,
        isToolbarVisible: true,
        tools: const [
          DeviceSection(
            model: true,
            orientation: false,
            frameVisibility: false,
            virtualKeyboard: false,
          ),
        ],
        builder: (context) {
          return ScreenUtilInit(
              useInheritedMediaQuery: true,
              designSize: const Size(300, 200),
              builder: (context, _) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  navigatorKey: navigatorKey,
                  home: const HomeScreen(),
                  builder: DevicePreview.appBuilder,
                );
              });
        });
  }
}
