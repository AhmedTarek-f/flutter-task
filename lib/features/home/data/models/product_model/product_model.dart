import 'package:flutter_task/features/home/data/models/product_model/rating.dart';

class ProductModel {
  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String? image;
  final Rating rating;

  factory ProductModel.fromJson(Map<String,dynamic> jsonData) {
    return ProductModel(
        id: jsonData['id'] as int,
        title: jsonData['title'] as String,
        price: jsonData['price'] as num,
        description: jsonData['description'] as String,
        category: jsonData['category'] as String,
        image: jsonData['image'] as String?,
        rating: Rating.fromJson(jsonData['rating'])
    );
  }
}