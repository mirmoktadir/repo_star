import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/data/local/hive/hive_adapters.dart';
import 'app/data/local/my_shared_pref.dart';
import 'app/service/helper/network_connectivity.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Device orientation
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  // init hive and adapters
  await HiveAdapters.registerAll();

  // Shared pref
  await MySharedPref.init();

  // Connectivity
  Future.delayed(Duration.zero, () {
    NetworkConnectivity.initConnectivityListener();
  });

  ///****************************************** My App ************************************///

  runApp(
    const MyApp(),
  );
}
