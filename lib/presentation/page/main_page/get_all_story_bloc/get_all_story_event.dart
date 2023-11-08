part of 'get_all_story_bloc.dart';

@immutable
sealed class GetAllStoryEvent {}

final class ActionGetAllStory extends GetAllStoryEvent {
  final String page;
  final String size;
  final String location;
  
  ActionGetAllStory({
    this.page = "1",
    this.size = "10",
    this.location = "1",
  });
}
