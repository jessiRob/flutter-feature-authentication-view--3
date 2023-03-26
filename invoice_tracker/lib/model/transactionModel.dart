
class TransactionModel {
  final String idUser;
  final String name;
  final String category;
  final double value;
  final DateTime date;
  final String paymentMethod;

  TransactionModel({
    required this.idUser,
    required this.name,
    required this.category,
    required this.value,
    required this.date,
    required this.paymentMethod,
  });
}