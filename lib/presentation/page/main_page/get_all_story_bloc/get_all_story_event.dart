part of 'get_all_story_bloc.dart';

enum ActionGetAllStoryType {
  refresh,
  infiniteScroll,
}

@immutable
sealed class GetAllStoryEvent {}

final class ActionGetAllStory extends GetAllStoryEvent {
  final ActionGetAllStoryType actionGetAllStoryType;
  final String page;
  final String size;
  final String location;

  ActionGetAllStory({
    this.actionGetAllStoryType = ActionGetAllStoryType.refresh,
    this.page = "1",
    this.size = "10",
    this.location = "1",
  });
}
