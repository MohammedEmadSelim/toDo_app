import 'package:dart_either/dart_either.dart';
import 'package:to_do_app/features/home/presentation/entites/todo_model.dart';

abstract class BaseHomeRepository {

  Future<Either> addTodo(String title,String description,DateTime date);
  Future <Either<String, List<MyModel>>> getTodo();
}