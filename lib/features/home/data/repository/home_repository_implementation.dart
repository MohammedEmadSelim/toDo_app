import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:to_do_app/features/home/domain/repository/base_home_repository.dart';
import 'package:to_do_app/features/home/presentation/entites/todo_model.dart';

class HomeRepositoryImplementation extends BaseHomeRepository {
  var instance = FirebaseFirestore.instance;

  @override
  Future<Either> addTodo(
      String title, String description, DateTime date) async {
    try {
      var collection = instance.collection('todo_list');
      var doc = await collection.add({
        'title': title,
        "description": description,
        'date': date,
      });

      return Right(doc);
    } catch (e) {


      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<MyModel>>> getTodo() async {
    var collection = await instance.collection('todo_list').get();
    try {

      var docs = collection.docs;

      var data = docs
          .map(
            (e) => MyModel.fromJson(e.data()),
          )
          .toList();
      print('================>object');
      return Right(data);
    } catch (e) {
      print('===========get todo failure $e');
      return Left(e.toString());
    }
  }
}
