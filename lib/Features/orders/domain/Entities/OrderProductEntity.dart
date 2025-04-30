// ignore_for_file: file_names

class Orderproductentity {
  final String code, imageUrl, name;
  final double price;

  final int quantity;

  Orderproductentity(
      {required this.code,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.quantity});
}
