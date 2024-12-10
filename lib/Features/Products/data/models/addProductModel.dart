import 'dart:io';

import 'package:fruits_hub_dashboard/Features/Products/data/models/ReviewModel.dart';
import 'package:fruits_hub_dashboard/Features/Products/domain/entities/addproduct_entitiy.dart';

class Addproductmodel {
  final String name;
  final String code;
  final String description;
  String? imageUrl;
  final bool isFeature;
  final String price;
  final String amout;
  final String caloriesUnit;
  final File image;
  final String expirnationsMonths;
  bool isOrganic = false;
  double rating = 0.0;
  final List<Reviewmodel> reviews;
  num sellingCount;
  Addproductmodel(
      {required this.name,
      required this.reviews,
      required this.price,
      required this.caloriesUnit,
      required this.expirnationsMonths,
      required this.isOrganic,
      required this.amout,
      required this.image,
      required this.code,
      required this.description,
      this.imageUrl,
      this.sellingCount = 0,
      required this.rating,
      required this.isFeature});
  factory Addproductmodel.fromEntity(
      {required AddproductEntitiy addproductEntity}) {
    return Addproductmodel(
        reviews: addproductEntity.reviews
            .map((e) => Reviewmodel.fromEntity(entity: e))
            .toList(),
        imageUrl: addproductEntity.imageUrl,
        name: addproductEntity.name,
        price: addproductEntity.price,
        amout: addproductEntity.amout,
        image: addproductEntity.image,
        code: addproductEntity.code,
        description: addproductEntity.description,
        isFeature: addproductEntity.isFeature,
        caloriesUnit: addproductEntity.caloriesUnit,
        expirnationsMonths: addproductEntity.expirnationsMonths,
        isOrganic: addproductEntity.isOrganic,
        rating: addproductEntity.rating);
  }
  toMap() {
    return {
      "name": name,
      "price": price,
      "amout": amout,
      "imageUrl": imageUrl,
      "code": code,
      "description": description,
      "isFeature": isFeature,
      "caloriesUnit": caloriesUnit,
      "expirnationsMonths": expirnationsMonths,
      "isOrganic": isOrganic,
      "rating": rating,
      "reviews": reviews.map((e) => e.toJson()).toList(),
      "sellingCount": sellingCount
    };
  }
}
