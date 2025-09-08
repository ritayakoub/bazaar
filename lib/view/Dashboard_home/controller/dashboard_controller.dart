import 'package:bazaar2/core/repositories/bazaarrepo.dart';
import 'package:bazaar2/core/repositories/orderrepo.dart';
import 'package:bazaar2/core/repositories/productrepo.dart';
import 'package:bazaar2/core/repositories/requestrepo.dart';
import 'package:bazaar2/view/home/model/bazaar.dart';
import 'package:bazaar2/view/home/model/ordersmodel.dart';
import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:bazaar2/view/home/model/requestmodel.dart';
import 'package:bazaar2/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
