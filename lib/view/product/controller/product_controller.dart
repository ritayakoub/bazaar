import 'dart:convert';
import 'dart:io';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/repositories/productrepo.dart';
import 'package:bazaar2/core/service/shared_preferences_key.dart';
import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:bazaar2/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  final ProductRepository _productRepo = ProductRepository();
  final formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController cost = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController category = TextEditingController();

  Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  RxList<Product> myOwnProducts = <Product>[].obs;
  var isLoading = false.obs;

  /// Pick image
  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      print("Image pick error: $e");
      ToastUtil.showToast("Failed to pick image");
    }
  }

  /// Create product (calls repo)
  Future<void> createProduct() async {
    if (selectedImage.value == null) {
      ToastUtil.showToast("Please select an image");
      return;
    }

    isLoading.value = true;
    try {
      final product = await _productRepo.createProduct(
        name.text,
        description.text,
        price.text,
        cost.text,
        quantity.text,
        '0',
        category.text,
        selectedImage.value!,
      );

      if (product != null) {
        myOwnProducts.add(product);
        ToastUtil.showToast("Product created successfully!");
        Get.back();
        loadOwnProducts();
      }
    } catch (e) {
      print("Error creating product: $e");
      ToastUtil.showToast("Failed to create product");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _productRepo.deleteProduct(id);
      loadOwnProducts();
      ToastUtil.showToast('You deleted the product!');
    } catch (e) {
      ToastUtil.showToast(e.toString());
    }
  }

  Future<void> loadOwnProducts() async {
    try {
      isLoading.value = true;
      final products = await _productRepo.fetchOwnProducts();
      myOwnProducts.assignAll(products);
    } catch (e) {
      print(e.toString());
      ToastUtil.showToast('Failed to load data, ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    loadOwnProducts();
    super.onInit();
  }
}
