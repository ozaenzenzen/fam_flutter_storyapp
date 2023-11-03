import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/model/request/register_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/register_response_model.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
