part of 'add_story_bloc.dart';

@immutable
sealed class AddStoryState {}

final class AddStoryInitial extends AddStoryState {}

final class AddStorySuccess extends AddStoryState {
  final GetAllStoryResponseModel getAllStoryResponseModel;
  AddStorySuccess({required this.getAllStoryResponseModel});
}

final class AddStoryLoading extends AddStoryState {}

final class AddStoryFailed extends AddStoryState {
  final String errorMessage;
  AddStoryFailed({required this.errorMessage});
}
