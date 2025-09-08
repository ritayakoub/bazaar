// import 'package:bazaar2/view/home/model/stor.dart';
// import 'package:bazaar2/view/store/widgets/Storecreated.dart';

// class StoreRepository {
//   Future<Store> fetchStores() async {
//    // return  Store();
//   }

//   Future<Store?> fetchStoreById(String id) async {
//     await Future.delayed(const Duration(seconds: 2));
//     return Storecreated.firstWhere((store) => store.id == id);
//   }

// Future<void> addReview(String storeId, Review newReview) async {
//   await Future.delayed(const Duration(seconds: 1));
// ignore: prefer_typing_uninitialized_variables
// final Store;
//Store.reviews.add(newReview);
import 'package:bazaar2/core/const_data/list.dart';
import 'package:bazaar2/view/home/model/stor.dart';

class CategoriesRepository {
  Future<List<Categories>> fetchCategories() async {
    await Future.delayed(Duration(seconds: 1));
    return category;
  }
}
