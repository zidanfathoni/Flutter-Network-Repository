import 'package:flutter_network_repository/presentation/home/home_cubit.dart';

import '../../../di/service_locator.dart';

class HomeModule {
  static Future<void> configureHomeModuleInjection() async {
    getIt.registerSingleton<HomeCubit>(
      HomeCubit(getIt())..fetchPosts(),
    );
  }
}
