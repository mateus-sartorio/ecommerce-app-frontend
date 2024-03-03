import 'package:decimal/decimal.dart';
import 'package:ecommerce_app/models/image.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final Decimal price;
  final Image cover;
  final List<Image> images;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.cover,
      required this.images});
}
