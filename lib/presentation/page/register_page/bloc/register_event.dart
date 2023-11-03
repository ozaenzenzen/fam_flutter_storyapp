part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class ActionRegister extends RegisterEvent {
  final RegisterRequestModel registerRequestModel;
  final AccountRepository accountRepository;
  ActionRegister({
    required this.registerRequestModel,
    required this.accountRepository,
  });
}
