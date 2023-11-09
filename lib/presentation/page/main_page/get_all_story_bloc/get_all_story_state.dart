part of 'get_all_story_bloc.dart';

@immutable
sealed class GetAllStoryState {}

final class GetAllStoryInitial extends GetAllStoryState {}

final class GetAllStoryLoading extends GetAllStoryState {}

final class GetAllStorySuccess extends GetAllStoryState {
  final List<ListStory> listStory;
  GetAllStorySuccess({required this.listStory});
  // final GetAllStoryResponseModel getAllStoryResponseModel;
  // GetAllStorySuccess({required this.getAllStoryResponseModel});
}

final class GetAllStoryFailed extends GetAllStoryState {
  final String errorMessage;
  GetAllStoryFailed({required this.errorMessage});
}
