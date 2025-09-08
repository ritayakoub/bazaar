class Ordersmodel {
  final int number;
  final double amount;
  final String customer;
  final String date;
  final String status;

  Ordersmodel({
    required this.number,
    required this.amount,
    required this.customer,
    required this.date,
    required this.status,
  });

  factory Ordersmodel.fromJson(Map<String, dynamic> json) {
    return Ordersmodel(
      number: json['number'],
      amount: json['amount'],
      customer: json['customer'],
      date: json['date'],
      status: json['status'],
    );
  }
}
