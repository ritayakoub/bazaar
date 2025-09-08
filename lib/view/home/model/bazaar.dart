import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:bazaar2/view/home/model/stor.dart';
import 'package:get/get.dart';

class Bazaar {
  final String id;
  final String image;
  final String name;
  final String details;
  final String firstDate;
  final String lastDate;
  final String status;
  final List<Product> products;
  final RxList<Review> reviews;

  Bazaar(
      {required List<Review> reviews,
      required this.id,
      required this.image,
      required this.name,
      required this.details,
      required this.firstDate,
      required this.lastDate,
      required this.status,
      required this.products,
      required String description})
      : reviews = reviews = RxList<Review>(reviews);
}
