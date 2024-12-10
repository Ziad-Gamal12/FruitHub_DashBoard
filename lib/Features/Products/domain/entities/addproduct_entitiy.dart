import 'dart:io';

import 'package:fruits_hub_dashboard/Features/Products/domain/entities/reviewsEntity.dart';

class AddproductEntitiy {
  final String name;
  final String code;
  final String description;
  String? imageUrl;
  final bool isFeature;
  final String price;
  final String amout;
  final String calories;
  final String caloriesUnit;
  final File image;
  final String expirnationsMonths;
  bool isOrganic = false;
  double rating = 0.0;
  final List<Reviewsentity> reviews;
  AddproductEntitiy(
      {required this.name,
      required this.reviews,
      required this.price,
      required this.caloriesUnit,
      required this.expirnationsMonths,
      required this.isOrganic,
      required this.calories,
      required this.amout,
      required this.image,
      required this.code,
      required this.description,
      this.imageUrl,
      required this.rating,
      required this.isFeature});
}
