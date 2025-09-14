import 'dart:convert';
import 'dart:io';

import 'package:bazaar2/core/const_data/list.dart';
import 'package:bazaar2/core/helper/appconfig.dart';
import 'package:bazaar2/core/service/link.dart';
import 'package:bazaar2/core/service/my_service.dart';
import 'package:bazaar2/core/service/shared_preferences_key.dart';
import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:bazaar2/widget/customtoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProductRepository {
  Future<List<Product>> fetchOwnProducts() async {
    final myService = Get.find<MyService>();
    final prefs = myService.sharedPreferences;
    final token = prefs.getString(SharedPreferencesKey.tokenKey);

    final response = await http.get(
      Uri.parse(AppLink.getOwnProducts),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['data'] != null) {
        return (data['data'] as List).map((json) {
          final product = Product.fromJson(json);

          if (product.image.contains("127.0.0.1")) {
            product.image = product.image
                .replaceAll("http://127.0.0.1:8000", AppConfig.getBaseUrl());
          }
          print('sssssssssssssssssssssss');
          return product;
        }).toList();
      } else {
        return [];
      }
    } else {
      Get.snackbar("Failed", "Failed to load products: ${response.statusCode}");
      throw Exception("Failed to load products: ${response.statusCode}");
    }
  }

  Future<Product?> createProduct(
    String name,
    String description,
    String price,
    String cost,
    String stockQty,
    String showInStore,
    String productCategory,
    File imageFile,
  ) async {
    try {
      final myService = Get.find<MyService>();
      final prefs = myService.sharedPreferences;
      final token = prefs.getString(SharedPreferencesKey.tokenKey);

      ToastUtil.showToast('Uploading product...');

      final request = http.MultipartRequest(
        'POST',
        Uri.parse(AppLink.createProduct),
      );

      request.headers['Authorization'] = 'Bearer $token';

      request.fields['name'] = name;
      request.fields['description'] = description;
      request.fields['price'] = price;
      request.fields['cost'] = cost;
      request.fields['stock_qty'] = stockQty; // لاحظ: أضفت stock_qty
      request.fields['show_in_store'] = showInStore;
      request.fields['product_category'] = productCategory;

      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          filename: 'product_image.jpg',
        ),
      );

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
        final createdProduct = Product.fromJson(data["data"]);

        if (createdProduct.image.contains("127.0.0.1")) {
          createdProduct.image = createdProduct.image
              .replaceAll("http://127.0.0.1:8000", AppConfig.getBaseUrl());
        }

        return createdProduct;
      } else {
        Get.snackbar("Error", data["message"] ?? "Failed to upload product");
        return null;
      }
    } on FormatException catch (e) {
      print('JSON parsing failed: $e');
      Get.snackbar(
          "Server Error", "Please check if the API endpoint is correct");
      return null;
    } catch (e) {
      print('Upload error: $e');
      Get.snackbar("Error", "Failed to upload product");
      return null;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final myService = Get.find<MyService>();
      final prefs = myService.sharedPreferences;
      final token = prefs.getString(SharedPreferencesKey.tokenKey);

      final response = await http.delete(
        Uri.parse('${AppLink.createProduct}/$id'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data["success"] == true) {
          return true;
        } else {
          throw Exception(data["message"] ?? "Failed to delete comment");
        }
      } else {
        throw Exception("Something went wrong (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return false;
    }
  }
}
