import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/features/auth/domain/repository/base_auth_repository.dart';

class AuthRepositoryImplementation extends BaseAuthRepository {
  var instance = FirebaseAuth.instance;

  @override
  Future<Either> signUpWithFirebase(String email, String password) async {
    try {
      var user = await instance.createUserWithEmailAndPassword(
          email: email, password: password);
      print(user);
      // suceess
      return Right('success');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> loginWithFirebase(String email, String password) async {
    try {
      var user = await instance.signInWithEmailAndPassword(
          email: email, password: password);
      // sucess
      return Right(user.user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> signOutFirebase() async {
    try {
      var res = instance.signOut(); // sucess
      return Right(res);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
