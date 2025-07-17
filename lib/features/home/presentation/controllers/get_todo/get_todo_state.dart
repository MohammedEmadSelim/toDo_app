part of 'get_todo_cubit.dart';

@immutable
sealed class GetTodoState {}

final class GetTodoInitial extends GetTodoState {}

final class GetTodoLoading extends GetTodoState {}

final class GetTodoFailure extends GetTodoState {
  final String message;

  GetTodoFailure(this.message);
}

final class GetTodoSuccess extends GetTodoState {
  final List<MyModel> todos;

  GetTodoSuccess(this.todos);
}
