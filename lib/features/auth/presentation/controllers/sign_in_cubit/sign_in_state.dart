part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignLoading extends SignInState {}

final class SignSuccess extends SignInState {}

final class SignFailure extends SignInState {
  final String message;

  SignFailure(this.message);
}
