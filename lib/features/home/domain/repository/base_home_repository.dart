import 'package:dart_either/dart_either.dart';

abstract class BaseHomeRepository {
  Future<Either> addTodo(String title, String description, DateTime date);
}
