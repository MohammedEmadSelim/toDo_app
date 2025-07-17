import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:to_do_app/features/home/data/models/to_do_model.dart';
import 'package:to_do_app/features/home/domain/entity/to_do_entity.dart';
import 'package:to_do_app/features/home/domain/repository/base_home_repository.dart';

class HomeRepositoryImolementation extends BaseHomeRepository {
  final instance = FirebaseFirestore.instance;
  @override
  Future<Either<String, DocumentReference>> addToDo(
    String title,
    String description,
    DateTime date,
  ) async {
    
    try {
      final collection = instance.collection('tasks');
      final document = await collection.add({
        'title': title,
        'description': description,
        'date': date,
      });
      return Right(document);
    } catch (e) {
      print('Firestore Error: $e');
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either> gettodolist() async{
   try {
      final snapshot = await instance.collection('tasks').get();
      final todos =
          snapshot.docs.map((doc) {
            return ToDoModel.fromMap(doc.data(), doc.id);
          }).toList();
      return Right(todos);
    } catch (e) {
      print("Firestore Error: $e");
      return Left(e.toString());
    }
  }
}
