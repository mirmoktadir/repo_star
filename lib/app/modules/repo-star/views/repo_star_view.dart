import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:repo_star/app/components/global-widgets/network_image_box.dart';
import 'package:repo_star/app/components/global-widgets/splash_container.dart';
import 'package:repo_star/app/modules/repo-star/model/repo_model.dart';
import 'package:repo_star/utils/date_converter.dart';

import '../../../../config/theme/my_fonts.dart';
import '../../../components/global-widgets/empty_widget.dart';
import '../../../components/global-widgets/main_appbar.dart';
import '../../../components/global-widgets/my_icon_button.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../service/helper/network_connectivity.dart';
import '../controllers/repo_star_controller.dart';

class RepoStarView extends GetView<RepoStarController> {
  const RepoStarView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Obx(() => Scaffold(
          appBar: MainAppBar(),
          body: controller.isError.value == true
              ? EmptyWidget(
                  onPressed: () async => await controller.getRepos(
                    controller.currentPage.value,
                    MySharedPref.getSorting(),
                  ),
                )
              // Main body widget //
              : RefreshIndicator(
                  color: theme.primaryColor,
                  onRefresh: () async {
                    if (await NetworkConnectivity.isNetworkAvailable()) {
                      controller.currentPage.value = 1;
                      MySharedPref.setCurrentPage("1");
                    }

                    await controller.getRepos(
                      controller.currentPage.value,
                      MySharedPref.getSorting(),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 640.h,
                        child: ListView.separated(
                            padding:
                                EdgeInsets.fromLTRB(25.sp, 25.sp, 25.sp, 0),
                            controller: controller.scrollController,
                            itemBuilder: (context, index) {
                              final repo = controller.repos[index];
                              return SplashContainer(
                                onPressed: () {
                                  controller.selectedRepo.value = index;
                                  Get.toNamed(AppPages.REPO_DETAILS);
                                },
                                radius: 15,
                                child: Padding(
                                  padding: EdgeInsets.all(16.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _repoHeading(repo, theme),
                                      // repo title and image
                                      _repoDescription(repo, theme),
                                      // repo description
                                      _repoTopics(repo, theme) // repo topics
                                      ,
                                      _repoCounts(repo, theme),
                                      // repo language and stars
                                      _repoUpdatedAt(repo, theme),
                                      // repo last update time
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 20.sp),
                            itemCount: controller.repos.length),
                      ),
                      _pagination(theme), // pagination widget
                    ],
                  ),
                ),
        ));
  }

  /// ----------Widgets-----------///
  // repo title and image
  Widget _repoHeading(Items repo, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp),
      child: Row(
        children: [
          SizedBox(
            height: 50.sp,
            width: 50.sp,
            child: NetworkImageBox(
                url: repo.owner?.avatarUrl.toString() ?? "", radius: 15),
          ),
          SizedBox(width: 12.sp),
          Expanded(
            child: Text(
              repo.fullName ?? "Name not found!",
              style: theme.textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }

// repo description
  Widget _repoDescription(Items repo, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp),
      child: Text(
        repo.description ?? "No description",
        style: theme.textTheme.bodyLarge,
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

// repo topics
  Widget _repoTopics(Items repo, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp),
      child: repo.topics!.isNotEmpty
          ? SizedBox(
              height: 28.sp,
              child: ListView.separated(
                itemCount: min(repo.topics!.length, 5),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(.6),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        repo.topics?[index] ?? "",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: MyFonts.body1TextSize),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              ),
            )
          : Text(
              "No topic!",
              style: theme.textTheme.bodyLarge,
            ),
    );
  }

// repo language and stars
  Widget _repoCounts(Items repo, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp),
      child: Row(
        children: [
          Text(
            repo.language ?? "No language",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(width: 15.sp),
          const Icon(IconlyBold.star, size: 20, color: Colors.orange),
          const SizedBox(width: 5),
          Text(
            controller.convertToK(repo.stargazersCount),
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

// repo last update time
  Widget _repoUpdatedAt(Items repo, ThemeData theme) {
    return Text(
      "Updated  ${timeDifference(inputTime: repo.updatedAt)}",
      style: theme.textTheme.bodyLarge,
    );
  }

  // pagination widget
  Widget _pagination(ThemeData theme) {
    return controller.repos.isNotEmpty
        ? Container(
            height: 65.sp,
            padding: EdgeInsets.only(bottom: 15.sp),
            color: theme.appBarTheme.backgroundColor?.withOpacity(.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyIconButton(
                  onPressed: controller.currentPage.value == 1
                      ? null
                      : () async {
                          await controller.getRepos(
                              controller.currentPage.value - 1,
                              MySharedPref.getSorting());
                          if (await NetworkConnectivity.isNetworkAvailable()) {
                            controller.currentPage.value--;
                            MySharedPref.setCurrentPage(
                                controller.currentPage.value.toString());
                          }
                        },
                  icon: Iconsax.previous,
                ),
                Text(
                  controller.currentPage.value.toString(),
                  style: theme.textTheme.bodyLarge,
                ),
                MyIconButton(
                  onPressed: () async {
                    await controller.getRepos(controller.currentPage.value + 1,
                        MySharedPref.getSorting());
                    if (await NetworkConnectivity.isNetworkAvailable()) {
                      controller.currentPage.value++;
                      MySharedPref.setCurrentPage(
                          controller.currentPage.value.toString());
                    }
                  },
                  icon: Iconsax.next,
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
