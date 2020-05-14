import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {
  String id;
  String name;
  String category;
  String image;
  List subIngredients;
  Timestamp createdAt;

  Exercise.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    image = data['image'];
    subIngredients = data['subIngredients'];
    createdAt = data['createdAt'];
  }
}
