// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/data/model/response/get_detail_story_response_model.dart';
import 'package:fam_flutter_storyapp/data/repository/local/local_repository.dart';
import 'package:fam_flutter_storyapp/data/repository/remote/stories_repository.dart';
import 'package:fam_flutter_storyapp/domain/entities/user_data_model.dart';
import 'package:meta/meta.dart';

part 'get_detail_story_event.dart';
part 'get_detail_story_state.dart';

class GetDetailStoryBloc extends Bloc<GetDetailStoryEvent, GetDetailStoryState> {
  GetDetailStoryBloc() : super(GetDetailStoryInitial()) {
    on<GetDetailStoryEvent>((event, emit) {
      if (event is ActionGetDetailStory) {
        actionGetDetailStoryFunc(event);
      }
    });
  }

  Future<void> actionGetDetailStoryFunc(ActionGetDetailStory event) async {
    emit(GetDetailStoryLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      UserDataModel? userDataModel = await LocalRepository.getUserData();
      if (userDataModel != null) {
        GetDetailStoryResponseModel? getDetailStoryResponseModel = await StoriesRepository().getDetailStory(
          token: userDataModel.token!,
          idStory: event.idStory,
        );
        if (getDetailStoryResponseModel != null) {
          if (getDetailStoryResponseModel.error == false) {
            emit(GetDetailStorySuccess(getDetailStoryResponseModel: getDetailStoryResponseModel));
          } else {
            emit(GetDetailStoryFailed(errorMessage: getDetailStoryResponseModel.message!));
          }
        } else {
          emit(GetDetailStoryFailed(errorMessage: "Empty data"));
        }
      } else {
        emit(GetDetailStoryFailed(errorMessage: "Empty required local data"));
      }
    } catch (e) {
      emit(GetDetailStoryFailed(errorMessage: e.toString()));
    }
  }
}
