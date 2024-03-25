import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_star/app/data/local/my_shared_pref.dart';
import 'package:repo_star/app/modules/repo-star/model/repo_model.dart';
import 'package:repo_star/app/service/handler/exception_handler.dart';

import '../../../components/global-widgets/my_snackbar.dart';
import '../../../data/local/hive/my_hive.dart';
import '../../../service/REST/api_urls.dart';
import '../../../service/REST/dio_client.dart';
import '../../../service/helper/network_connectivity.dart';

class RepoStarController extends GetxController with ExceptionHandler {
  ScrollController scrollController = ScrollController();
  final RxInt selectedRepo = 0.obs;
  final repos = RxList<Items>();
  RxInt currentPage = 1.obs;
  final DateTime _lastRefreshTime = DateTime.now();
  static const Duration _refreshInterval = Duration(minutes: 30);
  Timer? _refreshTimer;

  /// Repo star
  String convertToK(dynamic number) {
    if (number >= 1000) {
      return (number / 1000).toStringAsFixed(1) + 'k';
    } else {
      return number.toString();
    }
  }

  /// For Scroll ///
  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (await NetworkConnectivity.isNetworkAvailable()) {
        currentPage.value++;
        MySharedPref.setCurrentPage(currentPage.value.toString());
      }
      scrollController.jumpTo(0.0);
      await getRepos(currentPage.value, MySharedPref.getSorting());
      scrollController.jumpTo(scrollController.offset);
    }
  }

  ///  Refresher
  void _startRefreshTimer() {
    _refreshTimer = Timer.periodic(_refreshInterval, (Timer timer) {
      refreshData();
    });
  }

  void _cancelRefreshTimer() {
    _refreshTimer?.cancel();
  }

  void refreshData() async {
    final currentTime = DateTime.now();
    final timeSinceLastRefresh = currentTime.difference(_lastRefreshTime);

    if (timeSinceLastRefresh >= _refreshInterval) {
      await getRepos(currentPage.value, MySharedPref.getSorting());

      await 2.delay();
      MySnackBar.showInfoSnackBar(
          title: "Auto refresh!", message: 'Data reloaded after 30 minutes');
    }
  }

  ///----------------------- Calling the API-----------------------///
  getRepos(int pageNo, String sort) async {
    showLoading();
    if (await NetworkConnectivity.isNetworkAvailable()) {
      /// Fetch repositories from the API
      var response = await DioClient().get(
        url: ApiUrl.githubAPIBaseUrl,
        params: {
          'q': 'flutter',
          'sort': sort,
          'order': 'desc',
          'per_page': 10,
          'page': pageNo,
        },
      ).catchError(handleError);

      if (response == null) return;

      repos.assignAll(
          (response["items"] as List).map((e) => Items.fromJson(e)).toList());

      /// Save fetched repos to Hive for future use
      await MyHive.saveAllItems(repos);
      hideLoading();
    } else {
      /// If offline, try to load from Hive
      var savedRepos = MyHive.getAllItems();

      if (savedRepos.isNotEmpty) {
        repos.assignAll(savedRepos);

        hideLoading();
        MySnackBar.showErrorToast(message: "No network!");
        NetworkConnectivity.connectionChangeCount = 1;
        return;
      } else {
        isError.value = true;
        NetworkConnectivity.connectionChangeCount = 1;
        hideLoading();
        showErrorDialog("Oops!", "Connection problem");
        return;
      }
    }
  }

  @override
  void onReady() async {
    await MySharedPref.getSorting() ?? await MySharedPref.setSorting("stars");
    await MySharedPref.getCurrentPage() ??
        await MySharedPref.setCurrentPage(currentPage.value.toString());
    currentPage.value = int.parse(await MySharedPref.getCurrentPage());
    await getRepos(currentPage.value, MySharedPref.getSorting());

    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);

    _startRefreshTimer();
  }

  @override
  void dispose() {
    scrollController.dispose();
    _cancelRefreshTimer();
    super.dispose();
  }
}
