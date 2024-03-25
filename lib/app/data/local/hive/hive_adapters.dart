import 'package:repo_star/app/modules/repo-star/model/repo_model.dart';

import 'my_hive.dart';

class HiveAdapters {
  static Future<void> registerAll() async {
    await MyHive.init(registerAdapters: (hive) {
      hive.registerAdapter(RepoModelAdapter());
      hive.registerAdapter(ItemsAdapter());
      hive.registerAdapter(LicenseAdapter());
      hive.registerAdapter(OwnerAdapter());
    });
  }
}
