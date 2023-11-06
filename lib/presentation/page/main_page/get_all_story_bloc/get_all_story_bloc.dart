// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/model/response/get_all_story_response_model.dart';
import 'package:fam_flutter_storyapp/data/repository/local/local_repository.dart';
import 'package:fam_flutter_storyapp/data/repository/remote/stories_repository.dart';
import 'package:fam_flutter_storyapp/domain/entities/user_data_model.dart';
import 'package:meta/meta.dart';

part 'get_all_story_event.dart';
part 'get_all_story_state.dart';

class GetAllStoryBloc extends Bloc<GetAllStoryEvent, GetAllStoryState> {
  GetAllStoryBloc() : super(GetAllStoryInitial()) {
    on<GetAllStoryEvent>((event, emit) {
      if (event is ActionGetAllStory) {
        actionGetAllStoryFunc(event);
      }
    });
  }

  Future<void> actionGetAllStoryFunc(
    ActionGetAllStory event,
  ) async {
    emit(GetAllStoryLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      UserDataModel? userDataModel = await LocalRepository.getUserData();
      if (userDataModel != null) {
        GetAllStoryResponseModel? getAllStoryResponseModel = await StoriesRepository().getAllStory(userDataModel.token!);
        if (getAllStoryResponseModel != null) {
          if (getAllStoryResponseModel.error == false) {
            emit(GetAllStorySuccess(getAllStoryResponseModel: getAllStoryResponseModel));
          } else {
            emit(GetAllStoryFailed(errorMessage: getAllStoryResponseModel.message!));
          }
        } else {
          emit(GetAllStoryFailed(errorMessage: "Empty data"));
        }
      } else {
        emit(GetAllStoryFailed(errorMessage: "Empty required local data"));
      }
    } catch (e) {
      emit(GetAllStoryFailed(errorMessage: e.toString()));
    }
  }
}
