// ignore_for_file: file_names

import 'package:fruits_hub_dashboard/Features/Products/domain/entities/reviewsEntity.dart';

class Reviewmodel {
  final String name;
  final String imageUrl;
  final num reating;
  final String reviewDescriptionl;
  Reviewmodel({
    required this.name,
    required this.imageUrl,
    required this.reating,
    required this.reviewDescriptionl,
  });
  factory Reviewmodel.fromEntity({required Reviewsentity entity}) {
    return Reviewmodel(
        name: entity.name,
        imageUrl: entity.imageUrl,
        reating: entity.reating,
        reviewDescriptionl: entity.reviewDescriptionl);
  }
  factory Reviewmodel.fromJson(Map<String, dynamic> json) {
    return Reviewmodel(
        name: json["name"],
        imageUrl: json["imageUrl"],
        reating: json["reating"],
        reviewDescriptionl: json["reviewDescriptionl"]);
  }
  toJson() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "reating": reating,
      "reviewDescriptionl": reviewDescriptionl,
    };
  }
}
