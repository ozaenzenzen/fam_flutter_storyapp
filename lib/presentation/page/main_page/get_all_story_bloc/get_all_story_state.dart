part of 'get_all_story_bloc.dart';

@immutable
sealed class GetAllStoryState {}

final class GetAllStoryInitial extends GetAllStoryState {}

final class GetAllStoryLoading extends GetAllStoryState {
  final List<ListStory> listStory;
  final ActionGetAllStoryType actionGetAllStoryType;

  GetAllStoryLoading({
    required this.actionGetAllStoryType,
    required this.listStory,
  });
}

final class GetAllStorySuccess extends GetAllStoryState {
  final List<ListStory> listStory;
  final ActionGetAllStoryType actionGetAllStoryType;

  GetAllStorySuccess({
    required this.actionGetAllStoryType,
    required this.listStory,
  });
  // final GetAllStoryResponseModel getAllStoryResponseModel;
  // GetAllStorySuccess({required this.getAllStoryResponseModel});
}

final class GetAllStoryFailed extends GetAllStoryState {
  final String errorMessage;
  GetAllStoryFailed({required this.errorMessage});
}
