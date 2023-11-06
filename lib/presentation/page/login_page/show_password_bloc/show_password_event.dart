part of 'show_password_bloc.dart';

@immutable
sealed class ShowPasswordEvent {}

final class ActionShowPassword extends ShowPasswordEvent {
  final bool value;
  ActionShowPassword({required this.value});
}
