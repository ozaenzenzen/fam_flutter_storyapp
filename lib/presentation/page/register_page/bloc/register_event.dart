part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class ActionRegister extends RegisterEvent {
  final RegisterRequestModel registerRequestModel;
  ActionRegister({required this.registerRequestModel});
}
