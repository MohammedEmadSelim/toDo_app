import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/home/data/repository/home_repository_implementation.dart';
import 'package:to_do_app/features/home/domain/repository/base_home_repository.dart';
import 'package:to_do_app/features/home/presentation/entites/todo_model.dart';

part 'get_todo_state.dart';

class GetTodoCubit extends Cubit<GetTodoState> {
  GetTodoCubit() : super(GetTodoInitial());

  BaseHomeRepository baseHomeRepository = HomeRepositoryImplementation();

  Future<void> getTodo() async {
    emit(GetTodoLoading());
    var res = await baseHomeRepository.getTodo();
    res.fold(
      ifLeft: (value) {
        emit(GetTodoFailure(value));
      },
      ifRight: (value) {
        emit(GetTodoSuccess(value));
      },
    );
  }
}
