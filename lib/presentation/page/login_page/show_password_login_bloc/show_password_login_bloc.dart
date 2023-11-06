// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_password_login_event.dart';
part 'show_password_login_state.dart';

class ShowPasswordLoginBloc extends Bloc<ShowPasswordLoginEvent, ShowPasswordLoginState> {
  ShowPasswordLoginBloc() : super(ShowPasswordLoginFalse()) {
    on<ShowPasswordLoginEvent>((event, emit) {
      if (event is ActionShowPasswordLogin) {
        showPasswordFunc(event);
      }
    });
  }

  Future<void> showPasswordFunc(ActionShowPasswordLogin event) async {
    try {
      if (event.value) {
        emit(ShowPasswordLoginFalse());
      } else {
        emit(ShowPasswordLoginTrue());
      }
    } catch (e) {
      emit(ShowPasswordLoginFalse());
    }
  }
}
