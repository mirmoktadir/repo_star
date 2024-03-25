import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:repo_star/app/modules/repo-star/controllers/repo_star_controller.dart';
import 'package:repo_star/config/theme/my_theme.dart';

import '../../data/local/my_shared_pref.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({
    super.key,
  });
  final repoStarController = Get.put(RepoStarController());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      title: const Text('RepoStar'),
      elevation: 6,
      leading: IconButton(
        onPressed: () => MyTheme.changeTheme(),
        icon: Icon(
          Get.isDarkMode ? Iconsax.moon5 : Iconsax.moon5,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [_sortingDialog(theme)],
      centerTitle: true,
    );
  }

  _sortingDialog(ThemeData theme) {
    return Theme(
      data: theme.copyWith(
        highlightColor: theme.primaryColor.withOpacity(.5),
      ),
      child: PopupMenuButton<String>(
        onSelected: (String value) async {
          await MySharedPref.setSorting(value);
          await repoStarController.getRepos(
              repoStarController.currentPage.value, value);
        },
        initialValue: MySharedPref.getSorting(),
        icon: const Icon(Iconsax.sort),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'stars',
            child: Row(
              children: [
                Icon(Iconsax.star, size: 16.sp),
                SizedBox(width: 8.sp),
                Text(
                  'Stars',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'updated',
            child: Row(
              children: [
                Icon(Iconsax.clock, size: 16.sp),
                SizedBox(width: 8.sp),
                Text(
                  'Updated',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
