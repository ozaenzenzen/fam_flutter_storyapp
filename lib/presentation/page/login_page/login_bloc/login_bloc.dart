// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/model/request/login_request/login_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/login_response/login_response_model.dart';
import 'package:fam_flutter_storyapp/data/repository/local/local_repository.dart';
import 'package:fam_flutter_storyapp/data/repository/remote/account_repository.dart';
import 'package:fam_flutter_storyapp/domain/entities/user_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      if (event is ActionLogin) {
        _loginAction(event.accountRepository, event);
      }
    });
  }
  Future<void> _loginAction(
    AccountRepository accountReposistory,
    ActionLogin event,
  ) async {
    emit(LoginLoading());
    try {
      LoginResponseModel? loginResponseModel = await accountReposistory.login(
        event.loginRequestModel,
      );
      if (loginResponseModel != null) {
        if (loginResponseModel.error == false) {
          if (loginResponseModel.loginResult != null) {
            UserDataModel dataLocal = UserDataModel(
              userId: loginResponseModel.loginResult?.userId,
              name: loginResponseModel.loginResult?.name,
              token: loginResponseModel.loginResult?.token,
            );
            await LocalRepository.setUserData(dataLocal);
            await LocalRepository.setIsLogin(true);
            emit(
              LoginSuccess(
                loginResponseModel: loginResponseModel,
              ),
            );
          } else {
            emit(
              LoginFailed(
                errorMessage: loginResponseModel.message.toString(),
              ),
            );
          }
        } else {
          emit(
            LoginFailed(
              errorMessage: loginResponseModel.message.toString(),
            ),
          );
        }
      } else {
        emit(
          LoginFailed(
            errorMessage: "Terjadi kesalahan, data kosong",
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        LoginFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
