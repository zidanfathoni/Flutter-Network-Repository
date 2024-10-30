import 'package:flutter_network_repository/presentation/di/module/home_module.dart';

class PresentationLayerInjection {
  static Future<void> configurePresentationLayerInjection() async {
    await HomeModule.configureHomeModuleInjection();
  }
}
