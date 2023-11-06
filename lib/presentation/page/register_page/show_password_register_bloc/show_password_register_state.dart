part of 'show_password_register_bloc.dart';

@immutable
sealed class ShowPasswordRegisterState {}

final class ShowPasswordRegisterTrue extends ShowPasswordRegisterState {}

final class ShowPasswordRegisterFalse extends ShowPasswordRegisterState {}
