import 'package:flutter/material.dart';
import 'package:flutter_network_repository/di/service_locator.dart';

import 'presentation/flutter_network_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.configureServiceLocator();
  runApp(const FlutterNetworkRespository());
}
