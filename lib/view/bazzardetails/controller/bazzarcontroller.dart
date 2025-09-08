import 'dart:io';
import 'package:bazaar2/core/repositories/userrepo.dart';
import 'package:bazaar2/view/home/model/usermodel.dart';
import 'package:bazaar2/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BazzarController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController catController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController subStartController = TextEditingController();
  final TextEditingController subEndController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  // بيانات البازار
  var name = ''.obs;
  var description = ''.obs;
  var categories = <String>[].obs;
  var startDate = ''.obs;
  var endDate = ''.obs;
  var submissionStart = ''.obs;
  var submissionEnd = ''.obs;
  var location = ''.obs;
  var selectedIndex = 0.obs;
  var positiveness = 0.6.obs;
  var rating = 4.0.obs;
  final RxList<UserModel> usermodel = <UserModel>[].obs;
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);
      selectedImage.value = file;
    }
  }

  Future<void> loaduser() async {
    try {
      final users = await UserRepository.fetchuser();
      usermodel.assignAll(users);
      update();
    } catch (e) {
      ToastUtil.showToast("Error fetching users");
    }
  }

  @override
  void onInit() {
    loaduser();
    super.onInit();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void addCategory(String cat) {
    if (!categories.contains(cat)) {
      categories.add(cat);
    }
  }

  void removeCategory(String cat) {
    categories.remove(cat);
  }

  void saveBazzar() {
    // هون ممكن تعمل حفظ لقاعدة البيانات او API
    print("Saved Bazzar: $name at $location");
  }
}
