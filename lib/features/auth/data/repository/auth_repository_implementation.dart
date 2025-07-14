import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_app/features/auth/domain/repository/base_auth_repository.dart';

class AuthRepositoryImplementation extends BaseAuthRepository {
  @override
  Future<Either> signUpWithFirebase(String email, String password) {
    var instance = FirebaseAuth.instance;

    try {
      return Right("value");
    } catch (e) {
      return Left("value");
    }
  }
}
ٍ]