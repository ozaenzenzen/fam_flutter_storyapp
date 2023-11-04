// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/repository/local/local_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) {
      if (event is ActionLogout) {
        actionLogoutFunc(event);
      }
    });
  }

  Future<void> actionLogoutFunc(ActionLogout actionLogout) async {
    try {
      Future.microtask(() async {
        await LocalRepository.removeUserData();
        await LocalRepository.setIsLogin(false);
      }).then((value) {
        emit(LogoutSuccess());
      }).catchError((error) {
        emit(LogoutFailed(errorMessage: error.toString()));
      });
    } catch (e) {
      emit(LogoutFailed(errorMessage: e.toString()));
    }
  }
}
