// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_password_event.dart';
part 'show_password_state.dart';

class ShowPasswordBloc extends Bloc<ShowPasswordEvent, ShowPasswordState> {
  ShowPasswordBloc() : super(ShowPasswordFalse()) {
    on<ShowPasswordEvent>((event, emit) {
      if (event is ActionShowPassword) {
        showPasswordFunc(event);
      }
    });
  }

  Future<void> showPasswordFunc(ActionShowPassword event) async {
    try {
      if (event.value) {
        emit(ShowPasswordFalse());
      } else {
        emit(ShowPasswordTrue());
      }
    } catch (e) {
      emit(ShowPasswordFalse());
    }
  }
}
