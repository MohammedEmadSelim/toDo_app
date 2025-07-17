import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/home/data/repository/home_repository_imolementation.dart';
import 'package:to_do_app/features/home/domain/repository/base_home_repository.dart';

part 'add_to_do_state.dart';

class AddToDoCubit extends Cubit<AddToDoState> {
  AddToDoCubit() : super(AddToDoInitial());
  BaseHomeRepository baseHomeRepository = HomeRepositoryImolementation();
  Future<void> addToDo(String title, String description, DateTime date) async {
    emit(AddToDoLoading());
    var res = await baseHomeRepository.addToDo(title, description, date);
    res.fold(
      ifLeft: (error) => emit(AddToDoFailure(error)),
      ifRight: (value) => emit(AddToDoSuccess()),
    );
  }
}
