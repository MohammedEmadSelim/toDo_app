import 'package:cloud_firestore/cloud_firestore.dart';

class MyModel {
  DateTime date;
  String description;
  String title;

  MyModel({
    required this.date,
    required this.description,
    required this.title,
  });

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      date:(json['date'] as Timestamp).toDate(),
      description: json['description'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'description': description,
      'title': title,
    };
  }
}
