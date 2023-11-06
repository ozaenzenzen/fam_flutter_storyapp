// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/model/request/add_story_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/get_all_story_response_model.dart';
import 'package:fam_flutter_storyapp/data/repository/local/local_repository.dart';
import 'package:fam_flutter_storyapp/data/repository/remote/stories_repository.dart';
import 'package:fam_flutter_storyapp/domain/entities/user_data_model.dart';
import 'package:meta/meta.dart';

part 'add_story_event.dart';
part 'add_story_state.dart';

class AddStoryBloc extends Bloc<AddStoryEvent, AddStoryState> {
  AddStoryBloc() : super(AddStoryInitial()) {
    on<AddStoryEvent>((event, emit) {
      if (event is ActionAddStory) {
        actionAddStoryFunc();
      }
    });
  }

  Future<void> actionAddStoryFunc() async {
    try {
      UserDataModel? userDataModel = await LocalRepository.getUserData();
      if (userDataModel != null) {
        GetAllStoryResponseModel? getAllStoryResponseModel = await StoriesRepository().getAllStory(userDataModel.token!);
        if (getAllStoryResponseModel != null) {
          if (getAllStoryResponseModel.error == false) {
            emit(AddStorySuccess(getAllStoryResponseModel: getAllStoryResponseModel));
          } else {
            emit(AddStoryFailed(errorMessage: getAllStoryResponseModel.message!));
          }
        } else {
          emit(AddStoryFailed(errorMessage: "Empty data"));
        }
      } else {
        emit(AddStoryFailed(errorMessage: "Empty required local data"));
      }
    } catch (e) {
      emit(AddStoryFailed(errorMessage: e.toString()));
    }
  }
}
