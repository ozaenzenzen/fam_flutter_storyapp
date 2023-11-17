// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/model/request/register_request/register_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/register_response_model.dart';
import 'package:fam_flutter_storyapp/data/repository/remote/account_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      if (event is ActionRegister) {
        _registerAction(event.accountRepository, event);
      }
    });
  }

  Future<void> _registerAction(
    AccountRepository accountReposistory,
    ActionRegister event,
  ) async {
    emit(RegisterLoading());
    try {
      RegisterResponseModel? registerResponseModel = await accountReposistory.register(
        event.registerRequestModel,
      );
      if (registerResponseModel != null) {
        if (registerResponseModel.error == false) {
          emit(
            RegisterSuccess(
              registerResponseModel: registerResponseModel,
            ),
          );
        } else {
          emit(
            RegisterFailed(
              errorMessage: registerResponseModel.message.toString(),
            ),
          );
        }
      } else {
        emit(
          RegisterFailed(
            errorMessage: "Terjadi kesalahan, data kosong",
          ),
        );
      }
    } catch (errorMessage) {
      emit(
        RegisterFailed(
          errorMessage: errorMessage.toString(),
        ),
      );
    }
  }
}
