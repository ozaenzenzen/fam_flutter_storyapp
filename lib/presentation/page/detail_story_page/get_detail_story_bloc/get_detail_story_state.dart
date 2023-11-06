part of 'get_detail_story_bloc.dart';

@immutable
sealed class GetDetailStoryState {}

final class GetDetailStoryInitial extends GetDetailStoryState {}

final class GetDetailStoryLoading extends GetDetailStoryState {}

final class GetDetailStorySuccess extends GetDetailStoryState {
  final GetDetailStoryResponseModel getDetailStoryResponseModel;
  GetDetailStorySuccess({required this.getDetailStoryResponseModel});
}

final class GetDetailStoryFailed extends GetDetailStoryState {
  final String errorMessage;
  GetDetailStoryFailed({required this.errorMessage});
}
