import 'package:get/get.dart';
import 'package:repo_star/app/modules/repo-star/views/repo_details_view.dart';

import '../modules/repo-star/bindings/repo_star_binding.dart';
import '../modules/repo-star/views/repo_star_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const NAV = Routes.NAV;
  static const REPO_STAR = Routes.REPO_STAR;
  static const REPO_DETAILS = Routes.REPO_DETAILS;

  static final routes = [
    /// NAV BAR
    // GetPage(
    //   name: _Paths.NAV,
    //   page: () => const BottomNavbar(),
    //   binding: NavbarBinding(),
    // ),

    ///

    GetPage(
      name: _Paths.REPO_STAR,
      page: () => const RepoStarView(),
      binding: RepoStarBinding(),
    ),
    GetPage(
      name: _Paths.REPO_DETAILS,
      page: () => const RepoDetailsView(),
      binding: RepoStarBinding(),
    ),
  ];
}
