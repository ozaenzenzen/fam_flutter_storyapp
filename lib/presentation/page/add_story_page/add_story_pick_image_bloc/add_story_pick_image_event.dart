part of 'add_story_pick_image_bloc.dart';

@immutable
sealed class AddStoryPickImageEvent {}

final class ActionPickImage extends AddStoryPickImageEvent {
  final ImageSource type;
  ActionPickImage({required this.type});
}
