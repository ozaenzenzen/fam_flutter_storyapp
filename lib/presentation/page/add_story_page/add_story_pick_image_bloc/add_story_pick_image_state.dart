part of 'add_story_pick_image_bloc.dart';

@immutable
sealed class AddStoryPickImageState {}

final class AddStoryPickImageInitial extends AddStoryPickImageState {}

final class AddStoryPickImageFailed extends AddStoryPickImageState {
  final String errorMessage;
  AddStoryPickImageFailed({required this.errorMessage});
}

final class AddStoryPickImageSuccess extends AddStoryPickImageState {
  final File output;
  AddStoryPickImageSuccess({required this.output});
}

final class AddStoryPickImageLoading extends AddStoryPickImageState {}
