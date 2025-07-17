import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:to_do_app/features/home/domain/repository/base_home_repository.dart';

class HomeRepositoryImolementation extends BaseHomeRepository {
  @override
  Future<Either> addToDo(
    String title,
    String description,
    DateTime date,
  ) async {
    final instance = FirebaseFirestore.instance;
    try {
      final collection = instance.collection('tasks');
      final document = await collection.add({
        'title': title,
        'description': description,
        'date': date,
      });
      return Right(document);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
