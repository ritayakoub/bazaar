import 'package:bazaar2/core/const_data/list.dart';
import 'package:bazaar2/view/home/model/bazaar.dart';
import 'package:bazaar2/view/home/model/stor.dart';

class BazaarRepository {
  Future<List<Bazaar>> fetchBazaars() async {
    // هون انت ممكن تستبدلها بطلب API حقيقي
    await Future.delayed(const Duration(seconds: 1));
    return bazaarCardItems;
  }

  Future<Bazaar?> fetchBazaarById(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return bazaarCardItems.firstWhere((bazaar) => bazaar.id == id);
  }

  Future<void> addReview(String bazaarId, Review newReview) async {
    await Future.delayed(const Duration(seconds: 1));
    final bazaar = bazaarCardItems.firstWhere((p) => p.id == bazaarId);
    bazaar.reviews.add(newReview);
  }

  Future<void> createBazaar(Bazaar newBazaar) async {
    await Future.delayed(const Duration(seconds: 1));
    bazaarCardItems.add(newBazaar);
  }
}
