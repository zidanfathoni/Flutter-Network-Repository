import 'package:flutter_network_repository/domain/di/domain_layer_injection.dart';
import 'package:flutter_network_repository/presentation/di/presentation_layer_injection.dart';
import 'package:get_it/get_it.dart';
import '../data/di/data_layer_injection.dart';
import '../network/di/network_layer_injection.dart';
import '../service/di/service_injection.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> configureServiceLocator() async {
    await ServiceInjection.configureServiceLayerInjction();
    await DataLayerInjection.configureDataLayerInjction();
    await NetworkLayerInjection.configureNetworkLayerInjection();
    await DomainLayerInjection.configureDataLayerInjection();
    await PresentationLayerInjection.configurePresentationLayerInjection();
  }
}
