part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final RegisterResponseModel registerResponseModel;
  RegisterSuccess({required this.registerResponseModel});
}

final class RegisterFailed extends RegisterState {
  final String errorMessage;
  RegisterFailed({required this.errorMessage});
}
