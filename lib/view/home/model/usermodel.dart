class UserModel {
  final String name;
  final int products;
  final String imageuser;

  UserModel({
    required this.name,
    required this.products,
    required this.imageuser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      products: json['products'],
      imageuser: json['image'],
    );
  }
}
