import 'package:get/get.dart';

import '../controllers/repo_star_controller.dart';

class RepoStarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepoStarController>(
      () => RepoStarController(),
    );
  }
}
