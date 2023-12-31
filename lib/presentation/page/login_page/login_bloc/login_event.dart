part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class ActionLogin extends LoginEvent {
  final LoginRequestModel loginRequestModel;
  final AccountRepository accountRepository;
  ActionLogin({
    required this.loginRequestModel,
    required this.accountRepository,
  });
}
