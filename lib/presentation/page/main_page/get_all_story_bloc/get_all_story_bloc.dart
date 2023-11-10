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

  int? pageItems = 1;
  int sizeItems = 10;

  ActionGetAllStoryType actionGetAllStoryType = ActionGetAllStoryType.refresh;

  List<ListStory> listStoryHolder = [];

  Future<void> actionGetAllStoryFunc(
    ActionGetAllStory event,
  ) async {
    // if (pageItems == 1) {
    emit(GetAllStoryLoading(
      listStory: listStoryHolder,
      actionGetAllStoryType: event.actionGetAllStoryType,
    ));
    await Future.delayed(const Duration(seconds: 2));
    // }
    try {
      UserDataModel? userDataModel = await LocalRepository.getUserData();
      if (userDataModel != null) {
        GetAllStoryResponseModel? getAllStoryResponseModel = await StoriesRepository().getAllStory(
          token: userDataModel.token!,
          page: pageItems.toString(),
          size: sizeItems.toString(),
          // page: event.page,
          // size: event.size,
          location: event.location,
        );
        if (getAllStoryResponseModel != null) {
          if (getAllStoryResponseModel.error == false) {
            actionGetAllStoryType = event.actionGetAllStoryType;
            if (event.actionGetAllStoryType == ActionGetAllStoryType.refresh) {
              listStoryHolder.clear();
              pageItems = 1;
            }
            listStoryHolder.addAll(getAllStoryResponseModel.listStory!);

            /// todo-04-01: set the pageItems to null when the result is not the same as before
            if (listStoryHolder.length < sizeItems) {
              pageItems = null;
            } else {
              /// todo-01-04: increase the page after the API request is done
              pageItems = pageItems! + 1;
            }
            // print('pageITems now $pageItems');
            emit(GetAllStorySuccess(
              listStory: listStoryHolder,
              actionGetAllStoryType: event.actionGetAllStoryType,
            ));
            // emit(GetAllStorySuccess(getAllStoryResponseModel: getAllStoryResponseModel));
          } else {
            emit(GetAllStoryFailed(errorMessage: getAllStoryResponseModel.message!));
          }
        } else {
          listStoryHolder.clear();
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
