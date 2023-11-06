// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/repository/local/local_repository.dart';
import 'package:meta/meta.dart';

part 'check_islogin_event.dart';
part 'check_islogin_state.dart';

class CheckIsloginBloc extends Bloc<CheckIsloginEvent, CheckIsloginState> {
  CheckIsloginBloc() : super(CheckIsloginFalse()) {
    on<CheckIsloginEvent>((event, emit) {
      if (event is ActionCheckIslogin) {
        checkIsloginFunc(event);
      }
    });
  }

  Future<void> checkIsloginFunc(ActionCheckIslogin actionCheckIslogin) async {
    try {
      bool isLogin = await LocalRepository.getIsLogin();
      if (isLogin) {
        emit(CheckIsloginTrue());
      } else {
        emit(CheckIsloginFalse());
      }
    } catch (e) {
      emit(CheckIsloginFalse());
    }
  }
}
