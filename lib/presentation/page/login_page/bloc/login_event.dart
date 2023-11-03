part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class ActionLogin extends LoginEvent {
  final LoginRequestModel loginRequestModel;
  ActionLogin({required this.loginRequestModel});
}