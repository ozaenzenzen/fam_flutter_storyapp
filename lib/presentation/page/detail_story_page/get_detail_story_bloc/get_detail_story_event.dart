part of 'get_detail_story_bloc.dart';

@immutable
sealed class GetDetailStoryEvent {}

final class ActionGetDetailStory extends GetDetailStoryEvent {
  final String idStory;
  ActionGetDetailStory({required this.idStory});
}