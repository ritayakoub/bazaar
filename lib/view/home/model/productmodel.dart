import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Product {
  final String id;
  final String image;
  final String status;
  final int price;
  final String name;
  final String size;
  final String markerName;
  final String category;
  final RxList<Comment> comments;
  final String details;

  Product({
    required this.id,
    required this.image,
    required this.status,
    required this.price,
    required this.name,
    required this.markerName,
    required this.size,
    required this.category,
    required List<Comment> comments,
    required this.details,
  }) : comments = RxList<Comment>(comments);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      image: json['image'],
      status: json['status'],
      price: json['price'],
      size: json['size'],
      name: json['name'],
      markerName: json['storeName'],
      category: json['category'],
      comments: (json['comments'] as List)
          .map((comment) => Comment.fromJson(comment))
          .toList(),
      details: json['details'],
    );
  }
}

class Comment {
  final String profilePhoto;
  final String name;
  final double rating;
  final String comment;

  Comment(
      {required this.profilePhoto,
      required this.name,
      required this.rating,
      required this.comment});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        profilePhoto: json['profilePhoto'],
        name: json['name'],
        rating: (json['rating'] as num).toDouble(),
        comment: json['comment']);
  }
}
