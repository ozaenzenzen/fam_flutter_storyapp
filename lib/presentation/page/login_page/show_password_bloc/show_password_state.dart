part of 'show_password_bloc.dart';

@immutable
sealed class ShowPasswordState {}

final class ShowPasswordTrue extends ShowPasswordState {}

final class ShowPasswordFalse extends ShowPasswordState {}
