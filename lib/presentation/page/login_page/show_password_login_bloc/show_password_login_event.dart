part of 'show_password_login_bloc.dart';

@immutable
sealed class ShowPasswordLoginEvent {}

final class ActionShowPasswordLogin extends ShowPasswordLoginEvent {
  final bool value;
  ActionShowPasswordLogin({required this.value});
}
