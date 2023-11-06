part of 'add_story_bloc.dart';

@immutable
sealed class AddStoryEvent {}

final class ActionAddStory extends AddStoryEvent {
  final AddStoryRequestModel addStoryRequestModel;
  ActionAddStory({required this.addStoryRequestModel});
}
