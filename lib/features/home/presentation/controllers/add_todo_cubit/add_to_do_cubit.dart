import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/home/data/repository/home_repository_implementation.dart';
import 'package:to_do_app/features/home/domain/repository/base_home_repository.dart';

part 'add_to_do_state.dart';

class AddToDoCubit extends Cubit<AddToDoState> {
  AddToDoCubit() : super(AddToDoInitial());

  BaseHomeRepository baseHomeRepository = HomeRepositoryImplementation();
  DateTime date = DateTime.now();

  Future<void> addTodo(
    String title,
    String description,
    DateTime date,
  ) async {
    emit(AddToDoLoading());
    var res = await baseHomeRepository.addTodo(title, description, date);

    res.fold(
      ifLeft: (error) {
        print('===========get todo failure $error');
        emit(AddToDoFailure(error));
      },
      ifRight: (value) {
        emit(AddToDoSuccess());
      },
    );
  }
}
