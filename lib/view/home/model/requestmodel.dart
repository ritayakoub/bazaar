class Requestmodel {
  final int number;
  final String date;
  final String name;
  final String typerequest;
  final String image;
  Requestmodel({
    required this.number,
    required this.date,
    required this.name,
    required this.image,
    required this.typerequest,
  });

  factory Requestmodel.fromJson(Map<String, dynamic> json) {
    return Requestmodel(
      number: json['number'],
      date: json['date'],
      name: json['name'],
      image: json['image'],
      typerequest: json['typerequest'],
    );
  }
}
