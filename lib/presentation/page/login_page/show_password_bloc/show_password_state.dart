part of 'show_password_bloc.dart';

@immutable
sealed class ShowPasswordLoginState {}

final class ShowPasswordLoginTrue extends ShowPasswordLoginState {}

final class ShowPasswordLoginFalse extends ShowPasswordLoginState {}
