import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/bazzardetails/controller/bazzarcontroller.dart';
import 'package:bazaar2/view/bazzardetails/screen/bazzardetails.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/home/widgets/CustomDrawer.dart';
import 'package:bazaar2/widget/defaultappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateBazzar extends StatelessWidget {
  CreateBazzar({super.key}) {
    Get.put<BazzarController>(BazzarController(), permanent: true);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final BazzarController controller = Get.find<BazzarController>();
    final controllerH = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DefaultAppBar(
        onMenuTap: controllerH.toggleDrawer,
      ),
      drawer: CustomDrawer(
        width: MediaQueryUtil.screenWidth * 0.75, // أو أي عرض تحبيه
        onClose: () => controllerH.closeDrawer, // لإغلاق الـ Drawer
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQueryUtil.screenHeight / 52.75,
          left: MediaQueryUtil.screenWidth / 20.6,
          right: MediaQueryUtil.screenWidth / 20.6,
        ),
        child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create New Bazzar",
                        style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 17.16,
                          fontFamily: FontFamily.russoOne,
                        ),
                      ),
                      Text(
                        "Photo",
                        style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 22,
                          color: AppColors.darkGrey,
                          fontFamily: FontFamily.montserrat,
                        ),
                      ),
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                            height: MediaQueryUtil.screenHeight / 5,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.darkGrey,
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                MediaQueryUtil.screenWidth / 51.5,
                              ),
                              color: AppColors.white,
                            ),
                            child: controller.selectedImage.value == null
                                ? Center(
                                    child: Image.asset(
                                      AppImages.aboutAppIcon,
                                      color: AppColors.lightGrey,
                                      width: MediaQueryUtil.screenWidth / 15,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      MediaQueryUtil.screenWidth / 51.5,
                                    ),
                                    child: Image.file(
                                      controller.selectedImage.value!,
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                    ),
                                  ),
                          ),
                        );
                      }),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQueryUtil.screenHeight / 42,
                            bottom: MediaQueryUtil.screenHeight / 100),
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 22,
                              color: AppColors.darkGrey,
                              fontFamily: FontFamily.montserrat),
                        ),
                      ),
                      TextFormField(
                          validator: (value) => value == null || value.isEmpty
                              ? 'Enter Bazzar name'
                              : null,
                          controller: controller.nameController,
                          decoration: InputDecoration(
                            hintText: "Bazzar new year",
                            hintStyle: const TextStyle(
                              color: AppColors.borderLightGrey,
                              fontFamily: FontFamily.montserrat,
                            ),
                            fillColor: AppColors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQueryUtil.screenWidth / 51.5),
                              borderSide: const BorderSide(
                                  color: AppColors.borderLightGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQueryUtil.screenWidth / 51.5),
                                borderSide: const BorderSide(
                                    color: AppColors.borderLightGrey)),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQueryUtil.screenHeight / 42,
                            bottom: MediaQueryUtil.screenHeight / 100),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 22,
                              color: AppColors.darkGrey,
                              fontFamily: FontFamily.montserrat),
                        ),
                      ),
                      TextFormField(
                          controller: controller.descController,
                          decoration: InputDecoration(
                            hintText: "some sales on  adidas shops's",
                            hintStyle: const TextStyle(
                              color: AppColors.borderLightGrey,
                              fontFamily: FontFamily.montserrat,
                            ),
                            fillColor: AppColors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQueryUtil.screenWidth / 51.5),
                              borderSide: const BorderSide(
                                  color: AppColors.borderLightGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQueryUtil.screenWidth / 51.5),
                                borderSide: const BorderSide(
                                    color: AppColors.borderLightGrey)),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQueryUtil.screenHeight / 42,
                            bottom: MediaQueryUtil.screenHeight / 100),
                        child: Text(
                          "Category",
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 22,
                              color: AppColors.darkGrey,
                              fontFamily: FontFamily.montserrat),
                        ),
                      ),
                      Obx(() => Wrap(
                            spacing: MediaQueryUtil.screenWidth / 51,
                            children: controller.categories
                                .map((cat) => Chip(
                                      label: Text(cat),
                                      backgroundColor:
                                          AppColors.settingsLightOrange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            MediaQueryUtil.screenWidth / 40),
                                      ),
                                      deleteIcon: Icon(
                                        Icons.close,
                                        size: MediaQueryUtil.screenWidth / 22,
                                      ),
                                      deleteIconColor:
                                          AppColors.primaryOrangeColor,
                                      onDeleted: () =>
                                          controller.removeCategory(cat),
                                    ))
                                .toList(),
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                controller: controller.catController,
                                decoration: InputDecoration(
                                  hintText: "food x , fast food x",
                                  hintStyle: const TextStyle(
                                    color: AppColors.borderLightGrey,
                                    fontFamily: FontFamily.montserrat,
                                  ),
                                  fillColor: AppColors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        MediaQueryUtil.screenWidth / 51.5),
                                    borderSide: const BorderSide(
                                        color: AppColors.borderLightGrey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQueryUtil.screenWidth / 51.5),
                                      borderSide: const BorderSide(
                                          color: AppColors.borderLightGrey)),
                                )),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              final text = controller.catController.text.trim();

                              if (text.isEmpty) return;

                              if (controller.categories.isEmpty) {
                                controller.addCategory(text);
                                controller.catController.clear();
                              } else {
                                ScaffoldMessenger.of(Get.context!).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "You can't add more than one category",
                                      style: TextStyle(
                                          fontFamily: FontFamily.montserrat,
                                          fontSize:
                                              MediaQueryUtil.screenWidth / 24),
                                    ),
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQueryUtil.screenHeight / 42,
                                    bottom: MediaQueryUtil.screenHeight / 100,
                                  ),
                                  child: Text(
                                    "Start Date",
                                    style: TextStyle(
                                      fontSize: MediaQueryUtil.screenWidth / 22,
                                      color: AppColors.darkGrey,
                                      fontFamily: FontFamily.montserrat,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Enter  StartDate'
                                          : null,
                                  controller: controller.startDateController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    hintText: "1/5/2025",
                                    hintStyle: const TextStyle(
                                      color: AppColors.borderLightGrey,
                                      fontFamily: FontFamily.montserrat,
                                    ),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQueryUtil.screenWidth / 24),
                                      child: Image.asset(
                                        AppImages.calendarIcon,
                                        width: MediaQueryUtil.screenWidth / 16,
                                        height:
                                            MediaQueryUtil.screenHeight / 50,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    fillColor: AppColors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQueryUtil.screenWidth / 51.5),
                                      borderSide: const BorderSide(
                                          color: AppColors.borderLightGrey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQueryUtil.screenWidth / 51.5),
                                      borderSide: const BorderSide(
                                          color: AppColors.borderLightGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQueryUtil.screenWidth / 25,
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQueryUtil.screenHeight / 42,
                                    bottom: MediaQueryUtil.screenHeight / 100,
                                  ),
                                  child: Text(
                                    "End Date",
                                    style: TextStyle(
                                      fontSize: MediaQueryUtil.screenWidth / 22,
                                      color: AppColors.darkGrey,
                                      fontFamily: FontFamily.montserrat,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Enter EndDate'
                                          : null,
                                  controller: controller.endDateController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    hintText: "11/12/2025",
                                    hintStyle: const TextStyle(
                                      color: AppColors.borderLightGrey,
                                      fontFamily: FontFamily.montserrat,
                                    ),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQueryUtil.screenWidth / 24),
                                      child: Image.asset(
                                        AppImages.calendarIcon,
                                        width: MediaQueryUtil.screenWidth / 16,
                                        height:
                                            MediaQueryUtil.screenHeight / 50,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    fillColor: AppColors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQueryUtil.screenWidth / 51.5),
                                      borderSide: const BorderSide(
                                          color: AppColors.borderLightGrey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQueryUtil.screenWidth / 51.5),
                                      borderSide: const BorderSide(
                                          color: AppColors.borderLightGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQueryUtil.screenHeight / 42,
                                    bottom: MediaQueryUtil.screenHeight / 100,
                                  ),
                                  child: Text(
                                    "Start SubmitionDate",
                                    style: TextStyle(
                                      fontSize: MediaQueryUtil.screenWidth / 25,
                                      color: AppColors.darkGrey,
                                      fontFamily: FontFamily.montserrat,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Enter  Start Submition Date'
                                          : null,
                                  controller: controller.subStartController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    hintText: "1/5/2025",
                                    hintStyle: const TextStyle(
                                      color: AppColors.borderLightGrey,
                                      fontFamily: FontFamily.montserrat,
                                    ),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQueryUtil.screenWidth / 24),
                                      child: Image.asset(
                                        AppImages.calendarIcon,
                                        width: MediaQueryUtil.screenWidth / 16,
                                        height:
                                            MediaQueryUtil.screenHeight / 50,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    fillColor: AppColors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQueryUtil.screenWidth / 51.5),
                                      borderSide: const BorderSide(
                                          color: AppColors.borderLightGrey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQueryUtil.screenWidth / 51.5),
                                      borderSide: const BorderSide(
                                          color: AppColors.borderLightGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQueryUtil.screenWidth / 25,
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQueryUtil.screenHeight / 42,
                                    bottom: MediaQueryUtil.screenHeight / 100,
                                  ),
                                  child: Text(
                                    "End SubmitionDate",
                                    style: TextStyle(
                                      fontSize: MediaQueryUtil.screenWidth / 25,
                                      color: AppColors.darkGrey,
                                      fontFamily: FontFamily.montserrat,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Enter Endsubmition date'
                                          : null,
                                  controller: controller.subEndController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    hintText: "11/12/2025",
                                    hintStyle: const TextStyle(
                                      color: AppColors.borderLightGrey,
                                      fontFamily: FontFamily.montserrat,
                                    ),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQueryUtil.screenWidth / 24),
                                      child: Image.asset(
                                        AppImages.calendarIcon,
                                        width: MediaQueryUtil.screenWidth / 16,
                                        height:
                                            MediaQueryUtil.screenHeight / 50,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    fillColor: AppColors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQueryUtil.screenWidth / 51.5),
                                      borderSide: const BorderSide(
                                          color: AppColors.borderLightGrey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQueryUtil.screenWidth / 51.5),
                                      borderSide: const BorderSide(
                                          color: AppColors.borderLightGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]))),
      ),

      // // Location
      // TextField(
      //   controller: controller.locationController,
      //   decoration: InputDecoration(labelText: "Location"),
      // ),
      // SizedBox(height: 20),

      // Save Button
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQueryUtil.screenWidth / 20.6,
          vertical: MediaQueryUtil.screenHeight / 100,
        ),
        child: MaterialButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              controller.name.value = controller.nameController.text;
              controller.description.value = controller.descController.text;
              controller.startDate.value = controller.startDateController.text;
              controller.endDate.value = controller.endDateController.text;
              controller.submissionStart.value =
                  controller.subStartController.text;
              controller.submissionEnd.value = controller.subEndController.text;
              controller.location.value = controller.locationController.text;

              controller.saveBazzar();
              Get.off(() => Bazzardetails());
            }
          },
          color: AppColors.primaryOrangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              MediaQueryUtil.screenWidth / 51.5,
            ),
          ),
          child: Text(
            "Save",
            style: TextStyle(
              fontFamily: FontFamily.montserrat,
              color: AppColors.white,
              fontSize: MediaQueryUtil.screenWidth / 25.75,
            ),
          ),
        ),
      ),
    );
  }
}
