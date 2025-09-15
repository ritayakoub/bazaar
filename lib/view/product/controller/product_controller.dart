import 'dart:convert';
import 'dart:io';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/helper/appconfig.dart';
import 'package:bazaar2/core/repositories/productrepo.dart';
import 'package:bazaar2/core/service/link.dart';
import 'package:bazaar2/core/service/my_service.dart';
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

  Future<void> updateProduct(File? imageFile, String id) async {
    try {
      final myService = Get.find<MyService>();
      final prefs = myService.sharedPreferences;
      final token = prefs.getString(SharedPreferencesKey.tokenKey);

      if (token == null) {
        Get.snackbar("Error", "No token found, please login again");
        return;
      }

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${AppLink.createProduct}/$id'),
      );

      request.headers['Authorization'] = 'Bearer $token';
      request.fields['_method'] = "PUT";

      request.fields['name'] = name.text;
      request.fields['details'] = description.text;
      request.fields['price'] = price.text;
      request.fields['product_category'] = category.text;
      if (imageFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            imageFile.path,
            filename: 'product_image.jpg',
          ),
        );
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('Image upload response: ${response.statusCode}');
      print('Response body: ${response.body}');

      final contentType = response.headers['content-type'] ?? '';
      if (!contentType.contains('application/json')) {
        throw FormatException('Expected JSON but got: $contentType');
      }

      final dynamic data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["success"] == true) {
        final updatedProduct = Product.fromJson(data["data"]);

        if (updatedProduct.image.contains("127.0.0.1")) {
          updatedProduct.image = updatedProduct.image
              .replaceAll("http://127.0.0.1:8000", AppConfig.getBaseUrl());
        }

        ToastUtil.showToast('Product Updated successfully');
      } else {
        Get.snackbar("Error", data["message"] ?? "Failed to upload image");
      }
    } on FormatException catch (e) {
      print('JSON parsing failed: $e');
      Get.snackbar(
          "Server Error", "Please check if the API endpoint is correct");
    } catch (e) {
      print('Upload error: $e');
      Get.snackbar("Error", "Failed to upload image");
    }
  }

  @override
  void onInit() {
    loadOwnProducts();
    super.onInit();
  }
}
