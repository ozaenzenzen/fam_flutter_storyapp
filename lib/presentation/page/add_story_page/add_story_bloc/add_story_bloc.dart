// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/model/request/add_story_request/add_story_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/add_story_response/add_story_response_model.dart';
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
        actionAddStoryFunc(event);
      }
    });
  }

  Future<void> actionAddStoryFunc(ActionAddStory event) async {
    emit(AddStoryLoading());
    try {
      UserDataModel? userDataModel = await LocalRepository.getUserData();
      // Position currentPosition = await Geolocator.getCurrentPosition();
      // AddStoryRequestModel dataReq = event.addStoryRequestModel;
      // dataReq.lat = currentPosition.latitude;
      // dataReq.lon = currentPosition.longitude;
      if (userDataModel != null) {
        AddStoryResponseModel? addStoryResponseModel = await StoriesRepository().addStory(
          event.addStoryRequestModel,
          userDataModel.token!,
        );
        if (addStoryResponseModel != null) {
          if (addStoryResponseModel.error == false) {
            emit(AddStorySuccess(addStoryResponseModel: addStoryResponseModel));
          } else {
            emit(AddStoryFailed(errorMessage: addStoryResponseModel.message!));
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
