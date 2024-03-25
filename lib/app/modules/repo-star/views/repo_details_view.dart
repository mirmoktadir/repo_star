import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:repo_star/app/modules/repo-star/controllers/repo_star_controller.dart';
import 'package:repo_star/app/modules/repo-star/model/repo_model.dart';

import '../../../../config/theme/my_fonts.dart';
import '../../../../utils/date_converter.dart';
import '../../../components/global-widgets/network_image_box.dart';

class RepoDetailsView extends GetView<RepoStarController> {
  const RepoDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = controller.repos[controller.selectedRepo.value];
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repo Details'),
        centerTitle: true,
        elevation: 6,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _avatar(repo), // repo owner avatar
              SizedBox(height: 12.sp),
              _repoOwner(repo, theme), // repo owner name
              SizedBox(height: 5.sp),
              _repoStars(repo, theme), // repo stars
              SizedBox(height: 50.sp),
              _repoInfo(repo, theme), // repo information
              SizedBox(height: 12.sp),
              repo.topics!.isNotEmpty
                  ? _repoTopics(repo, theme) // repo topics
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  ///--------------Widgets------------------///

  // repo owner avatar
  Widget _avatar(Items repo) {
    return Center(
      child: SizedBox(
        height: 100.sp,
        width: 100.sp,
        child: NetworkImageBox(
            url: repo.owner?.avatarUrl.toString() ?? "", radius: 50),
      ),
    );
  }

  // repo owner name
  Widget _repoOwner(Items repo, ThemeData theme) {
    return Center(
      child: Text(
        repo.name ?? "Name not found!",
        style: theme.textTheme.headlineSmall,
      ),
    );
  }

  // repo stars
  Widget _repoStars(Items repo, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(IconlyBold.star, size: 20, color: Colors.orange),
        const SizedBox(width: 5),
        Text(
          controller.convertToK(repo.stargazersCount),
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }

  // repo information
  Widget _repoInfo(Items repo, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          repo.fullName ?? "Name not found!",
          style: theme.textTheme.headlineSmall,
        ),
        SizedBox(height: 12.sp),
        Text(
          repo.description ?? "No description",
          style: theme.textTheme.bodyLarge,
          maxLines: 15,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.sp),
        Text(
          "Created at: ${dateConverter(inputTime: repo.createdAt, outputFormat: 'MM/dd/yy  hh:ss')}",
          style: theme.textTheme.bodyLarge,
        ),
        SizedBox(height: 8.sp),
        Text(
          "Updated at: ${dateConverter(inputTime: repo.updatedAt, outputFormat: 'MM/dd/yy  hh:ss')}",
          style: theme.textTheme.bodyLarge,
        ),
        SizedBox(height: 8.sp),
        Text(
          repo.language ?? "No language",
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }

  // repo topics
  Widget _repoTopics(Items repo, ThemeData theme) {
    return SizedBox(
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
    );
  }
}
