import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/model/request/login_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/login_response_model.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
