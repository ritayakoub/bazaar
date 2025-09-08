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
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  final ProductRepository _productRepo = ProductRepository();
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController cost = TextEditingController();
  final TextEditingController price = TextEditingController();
  final Rx<Product?> product = Rx<Product?>(null);
  final RxString commentText = ''.obs;
  TextEditingController commentController = TextEditingController();
  final RxBool isLoadingAddingComment = false.obs;
  final RxBool isLoadingFetching = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  var hasProducts = false.obs;
  var isLoading = false.obs;
  var productCount = 0.obs; // عدد المنتجات

  Future<void> checkIfProductsExist() async {
    final url = Uri.parse('https://your-api.com/products'); // عدّل حسب API تبعك
    isLoading.value = true;

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List products = json.decode(response.body);
        productCount.value = products.length;
        hasProducts.value = products.isNotEmpty;
      } else {
        print('فشل في جلب المنتجات: ${response.statusCode}');
        hasProducts.value = false;
      }
    } catch (e) {
      print('حدث خطأ: $e');
      hasProducts.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addProductToServer() async {
    final url = Uri.parse('https://your-api.com/products');

    final body = {
      'name': name.text,
      'description': description.text,
      'quantity': int.tryParse(quantity.text) ?? 0,
      'cost': double.tryParse(cost.text) ?? 0,
      'price': double.tryParse(price.text) ?? 0,
    };

    if (selectedImage.value != null) {
      final bytes = await selectedImage.value!.readAsBytes();
      body['image'] = base64Encode(bytes);
    }

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('✅ Product added successfully');
        // مسح الحقول أو تحديث واجهة المستخدم إذا تريد
      } else {
        print('❌ Failed to add product: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠️ Error sending product: $e');
    }
  }

  Future<void> fetchProduct(String id) async {
    try {
      isLoadingFetching.value = true;
      product.value = await _productRepo.fetchProductById(id);
    } catch (e) {
      ToastUtil.showToast('Failed to load product, ${e.toString()}');
    } finally {
      isLoadingFetching.value = false;
    }
  }

  /// ✅ دالة لإضافة منتجات
  Future<void> addProducts() async {
    final url = Uri.parse('https://your-api.com/products'); // عدّل حسب API تبعك
    isLoading.value = true;
    await checkIfProductsExist();

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': 'منتج تجريبي',
          'price': 100,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('✅ تم إضافة المنتج');
        await checkIfProductsExist(); // إعادة تحميل المنتجات
      } else {
        print('❌ فشل في الإضافة: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠️ خطأ أثناء الإضافة: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ اختيار صورة من المعرض وتخزينها
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);
      selectedImage.value = file;
    }
  }

  Future<void> addComment(Product product, String comment) async {
    if (comment.isEmpty || isLoadingAddingComment.value) return;

    isLoadingAddingComment.value = true;

    try {
      final prefs = await SharedPreferences.getInstance();

      final String? userName =
          prefs.getString(SharedPreferencesKey.userNameKey);
      final String? userImage =
          prefs.getString(SharedPreferencesKey.userImageKey);

      final newComment = Comment(
        profilePhoto: userImage != null && userImage.isNotEmpty
            ? userImage
            : AppImages.profilephoto,
        name:
            userName != null && userName.isNotEmpty ? userName : "Current User",
        rating: 5,
        comment: comment,
      );

      await _productRepo.addComment(product.id, newComment);

      commentText.value = '';
      commentController.clear();
      ToastUtil.showToast('Comment added!');
    } catch (e) {
      ToastUtil.showToast('Failed to add comment!');
    } finally {
      isLoadingAddingComment.value = false;
    }
  }

  @override
  void onInit() {
    checkIfProductsExist();
    super.onInit();
  }
}
