import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:get/get.dart';

class Store {
  final String id;
  final String image;
  final String sort;
  final double rating;
  final String name;
  final String address;
  final int storeNumber;
  final double latitude;
  final double longitude;
  final List<Product> products;
  final RxList<Review> reviews;

  Store({
    required List<Review> reviews,
    required this.id,
    required this.image,
    required this.sort,
    required this.rating,
    required this.name,
    required this.storeNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.products,
  }) : reviews = RxList<Review>(reviews);

  /// ✅ تحويل من JSON إلى Store
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'].toString(),
      image: json['image'] ?? "",
      sort: json['sort'] ?? "",
      rating: (json['rating'] ?? 0).toDouble(),
      name: json['name'] ?? "",
      storeNumber: json['storeNumber'] ?? 0,
      address: json['address'] ?? "",
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      products: (json['products'] as List<dynamic>? ?? [])
          .map((e) => Product.fromJson(e))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => Review.fromJson(e))
          .toList(),
    );
  }
}

class Review {
  final String profilePhoto;
  final String name;
  final double rating;
  final String review;

  Review({
    required this.profilePhoto,
    required this.name,
    required this.rating,
    required this.review,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      profilePhoto: json['profilePhoto'] ?? "",
      name: json['name'] ?? "",
      rating: (json['rating'] ?? 0).toDouble(),
      review: json['review'] ?? "",
    );
  }
}

class Categories {
  final String categoryname;
  Categories({required this.categoryname});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(categoryname: json['categoryname'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {"categoryname": categoryname};
  }
}
