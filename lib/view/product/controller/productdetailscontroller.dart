import 'package:bazaar2/core/repositories/productrepo.dart';
import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:bazaar2/view/model/commentmodel.dart';
import 'package:bazaar2/widget/customtoast.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final ProductRepository _productRepo = ProductRepository();
  Product? product;
  bool isLoadingFetching = false;
  final List<Comment> comments = <Comment>[];
  final String id;

  ProductDetailsController(this.id);

  Future<void> fetchProduct(String id) async {
    try {
      isLoadingFetching = true;
      update();
      final fetchedProduct = await _productRepo.fetchProductById(id);
      product = fetchedProduct;
      comments.assignAll(fetchedProduct!.comments);
    } catch (e) {
      ToastUtil.showToast('Failed to load product, ${e.toString()}');
    } finally {
      isLoadingFetching = false;
      update();
    }
  }

  @override
  void onInit() {
    fetchProduct(id);
    super.onInit();
  }
}
