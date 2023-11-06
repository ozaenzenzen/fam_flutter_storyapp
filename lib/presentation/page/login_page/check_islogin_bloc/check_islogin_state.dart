part of 'check_islogin_bloc.dart';

@immutable
sealed class CheckIsloginState {}

final class CheckIsloginFalse extends CheckIsloginState {}

final class CheckIsloginTrue extends CheckIsloginState {}
