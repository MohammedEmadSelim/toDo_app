import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/home/data/models/to_do_model.dart';
import 'package:to_do_app/features/home/data/repository/home_repository_imolementation.dart';
import 'package:to_do_app/features/home/domain/repository/base_home_repository.dart';

part 'get_to_do_list_state.dart';

class GetToDoListCubit extends Cubit<GetToDoListState> {
  GetToDoListCubit() : super(GetToDoListInitial());
  BaseHomeRepository baseHomeRepository = HomeRepositoryImolementation();

  Future<void> getTodoList() async {
    emit(GetTodoLoading());
    var res = await baseHomeRepository.gettodolist();
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
