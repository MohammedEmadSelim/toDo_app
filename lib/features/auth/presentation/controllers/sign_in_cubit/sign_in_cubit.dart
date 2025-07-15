import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:to_do_app/features/auth/domain/repository/base_auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final BaseAuthRepository base = AuthRepositoryImplementation();

  Future<void> signInWIthFirebase(String email, String password) async {
    var res = await base.loginWithFirebase(email, password);

    res.fold(
      ifLeft: (value) {
        print(value);
        emit(SignFailure(value));
      },
      ifRight: (value) {
        print(value);
        emit(SignSuccess());
      },
    );
  }
}
