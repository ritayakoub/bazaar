import 'dart:convert';
import 'dart:io';

import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/const_data.dart';
import 'package:bazaar2/core/repositories/bazaarrepo.dart';
import 'package:bazaar2/core/repositories/orderrepo.dart';
import 'package:bazaar2/core/repositories/productrepo.dart';
import 'package:bazaar2/core/repositories/requestrepo.dart';
import 'package:bazaar2/core/service/link.dart';
import 'package:bazaar2/core/service/my_service.dart';
import 'package:bazaar2/core/service/routes.dart';
import 'package:bazaar2/core/service/shared_preferences_key.dart';
import 'package:bazaar2/view/home/model/bazaar.dart';
import 'package:bazaar2/view/home/model/ordersmodel.dart';
import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:bazaar2/view/home/model/requestmodel.dart';
import 'package:bazaar2/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  var totalSales = 15.9.obs;
  var revenue = 2000.obs;
  var totalOrders = 1925.obs;
  var products = 52.obs;
  final RxList<Ordersmodel> orderItems = <Ordersmodel>[].obs;
  final OrdertRepository orderRepository = OrdertRepository();

  final RxList<Product> productCardItem = <Product>[].obs;
  final ProductRepository productRepo = ProductRepository();

  final BazaarRepository bazaarRepo = BazaarRepository();
  final RxList<Bazaar> bazaarCardItem = <Bazaar>[].obs;

  final RxList<Requestmodel> request = <Requestmodel>[].obs;
  final Requestrepo requestrepo = Requestrepo();

  bool isLoading = false;
  int selectedIndex = 0;
  final PageController pageController = PageController();
  late final List<String> productItemIds;
  late final List<String> bazaarItemIds;
  late final List<String> storeItemIds;

  final List<dynamic> allItems = <dynamic>[];
  Future<void> loadInitialData() async {
    try {
      isLoading = true;
      update();
      await Future.delayed(const Duration(seconds: 3));

      final products = await productRepo.fetchProducts();
      productCardItem.assignAll(products);

      final bazaars = await bazaarRepo.fetchBazaars();
      bazaarCardItem.assignAll(bazaars);

      productItemIds = productCardItem.map((product) => product.id).toList();
      bazaarItemIds = bazaarCardItem.map((bazaar) => bazaar.id).toList();
      final tempItems = [
        ...productCardItem
            .map((product) => {'type': 'product', 'data': product}),
      ];

      tempItems.shuffle();
      allItems.assignAll(tempItems);
    } catch (e) {
      ToastUtil.showToast('Failed to load data, ${e.toString()}');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> refreshData() async {
    try {
      isLoading = true;
      update();
      await Future.delayed(const Duration(seconds: 2));

      final products = await productRepo.fetchProducts();
      productCardItem.assignAll(products);

      final tempItems = [
        ...productCardItem
            .map((product) => {'type': 'product', 'data': product}),
      ];
      final bazaars = await bazaarRepo.fetchBazaars();
      bazaarCardItem.assignAll(bazaars);
      tempItems.shuffle();
      allItems.assignAll(tempItems);
      updateSelectedIndex(0);
    } catch (e) {
      ToastUtil.showToast("Couldn't refresh feed");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> loadOrders() async {
    try {
      final orders = await orderRepository.fetchorder();
      orderItems.assignAll(orders);
      update();
    } catch (e) {
      ToastUtil.showToast("Error fetching orders");
    }
  }

  Future<void> loadrequest() async {
    try {
      final lodarreq = await requestrepo.fetchrequest();
      request.assignAll(lodarreq);
      update();
    } catch (e) {
      ToastUtil.showToast("Error fetching request");
    }
  }

  @override
  void onInit() {
    loadInitialData();
    loadOrders();
    loadrequest();
    super.onInit();
  }

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  void updateRevenue(int value) {
    revenue.value = value;
  }

  void updateSales(double value) {
    totalSales.value = value;
  }

  void updateOrders(int value) {
    totalOrders.value = value;
  }

  void updateProducts(int value) {
    products.value = value;
  }

  Future<void> deleteUserInfo() async {
    try {
      final myService = Get.find<MyService>();
      final token =
          myService.sharedPreferences.getString(SharedPreferencesKey.tokenKey);
      if (token == null) {
        Get.snackbar("Error", "No token found");
        return;
      }
      final response = await http.post(
        Uri.parse(AppLink.logout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["success"] == true) {
        await myService.sharedPreferences.clear();

        ConstData.token = "";

        final tempFile = File('${Directory.systemTemp.path}/profile_image.jpg');
        if (await tempFile.exists()) {
          await tempFile.delete();
        }
        ToastUtil.showToast(data["message"]);
        Get.offAllNamed(Routes.login);
      } else {
        Get.snackbar("Error", data["message"] ?? "Failed to logout");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> logout() async {
    Get.defaultDialog(
        title: 'Logout',
        titleStyle: const TextStyle(color: AppColors.primaryFontColor),
        middleText: 'You sure you want to log out?',
        middleTextStyle: const TextStyle(color: AppColors.primaryOrangeColor),
        backgroundColor: AppColors.white,
        buttonColor: AppColors.primaryOrangeColor,
        cancelTextColor: AppColors.primaryFontColor,
        textConfirm: 'Logout!',
        textCancel: 'Cancel',
        confirmTextColor: AppColors.white,
        onConfirm: () async {
          deleteUserInfo();
        },
        onCancel: () => Get.back());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
