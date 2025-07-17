import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:to_do_app/features/home/domain/repository/base_home_repository.dart';

class HomeRepositoryImplementation extends BaseHomeRepository {
  @override
  Future<Either> addTodo(
      String title, String description, DateTime date) async {
    var instance = FirebaseFirestore.instance;

    try {
      var collection = instance.collection("tode_list");
      var doc = await collection
          .add({"title": title, "descrebtion": description, "dete": date});
      return Right(doc);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
