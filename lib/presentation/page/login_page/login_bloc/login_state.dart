part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponseModel;
  LoginSuccess({required this.loginResponseModel});
}

final class LoginFailed extends LoginState {
  final String errorMessage;
  LoginFailed({required this.errorMessage});
}
