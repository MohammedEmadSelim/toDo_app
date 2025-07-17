import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/features/home/domain/entity/to_do_entity.dart';

class ToDoModel extends ToDoEntity {
  ToDoModel({
    required String id,
    required String title,
    required String description,
    required DateTime date,
  }) : super(id: id, title: title, description: description, date: date);

  factory ToDoModel.fromMap(Map<String, dynamic> map, String id) {
    if (id.isEmpty) {
      throw ArgumentError('ID cannot be empty');
    }

    try {
      return ToDoModel(
        id: id,
        title: map['title']?.toString() ?? '',
        description: map['description']?.toString() ?? '',
        date:
            map['date'] != null
                ? (map['date'] as Timestamp).toDate()
                : DateTime.now(),
      );
    } catch (e) {
      throw Exception('Error parsing ToDoModel: $e');
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': Timestamp.fromDate(date),
    };
  }

  ToDoModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
  }) {
    return ToDoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'ToDoModel(id: $id, title: $title, description: $description, date: $date)';
  }
}
