// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_password_register_event.dart';
part 'show_password_register_state.dart';

class ShowPasswordRegisterBloc extends Bloc<ShowPasswordRegisterEvent, ShowPasswordRegisterState> {
  ShowPasswordRegisterBloc() : super(ShowPasswordRegisterFalse()) {
    on<ShowPasswordRegisterEvent>((event, emit) {
      if (event is ActionShowPasswordRegister) {
        showPasswordFunc(event);
      }
    });
  }

  Future<void> showPasswordFunc(ActionShowPasswordRegister event) async {
    try {
      if (event.value) {
        emit(ShowPasswordRegisterFalse());
      } else {
        emit(ShowPasswordRegisterTrue());
      }
    } catch (e) {
      emit(ShowPasswordRegisterFalse());
    }
  }
}
