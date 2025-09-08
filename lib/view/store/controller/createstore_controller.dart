import 'dart:io';
import 'package:bazaar2/core/repositories/storrepo.dart';
import 'package:bazaar2/view/home/model/stor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatestoreController extends GetxController {
  var hasStore = false.obs;
  var isLoading = true.obs;
  Future<void> checkStore() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    hasStore.value = false; // أو true حسب منطقك أو من API
    isLoading.value = false;
  }

  // ✅ متغيرات الموقع والنوع
  final PageController pageController = PageController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandTypeController = TextEditingController();
  String? storeLocation;

  Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  final RxList<Categories> categoryList = <Categories>[].obs;
  final repository = CategoriesRepository();

  void loadCategories() async {
    final categories = await repository.fetchCategories();
    categoryList.assignAll(categories);
  }

  // ✅ اختيار صورة من المعرض وتخزينها
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);
      selectedImage.value = file;
    }
  }

  Future<void> deleteStore() async {
    // استدعاء API للحذف
    // storeData.value = null;
    hasStore.value = false;
  }

  @override
  void onInit() {
    checkStore();
    loadCategories();
    // يتفعل تلقائياً عند بداية الصفحة
    super.onInit();
  }

  @override
  void onClose() {
    locationController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
