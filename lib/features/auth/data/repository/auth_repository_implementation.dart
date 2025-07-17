import 'package:dart_either/dart_either.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/features/auth/domain/repository/base_auth_repository.dart';

class AuthRepositoryImplementation extends BaseAuthRepository {
  var instance = FirebaseAuth.instance;

  @override
  Future<Either> signUpWithFirebase(String email, String password) async {

    try {
      var user = await instance.createUserWithEmailAndPassword(
          email: email, password: password);
      // suceess
      return Right('success');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> loginWithFirebase(String email, String password) async{
    try{
     var user= await instance.signInWithEmailAndPassword(email: email, password: password);
      // sucess
      return Right(user.user);
    }catch(e){
      return Left(e.toString());
    }
    throw UnimplementedError();
  }
}
