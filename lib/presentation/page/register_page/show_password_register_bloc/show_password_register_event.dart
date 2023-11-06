part of 'show_password_register_bloc.dart';

@immutable
sealed class ShowPasswordRegisterEvent {}

final class ActionShowPasswordRegister extends ShowPasswordRegisterEvent {
  final bool value;
  ActionShowPasswordRegister({required this.value});
}
