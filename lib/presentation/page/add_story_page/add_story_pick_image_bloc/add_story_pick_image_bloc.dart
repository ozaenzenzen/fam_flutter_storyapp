// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fam_flutter_storyapp/support/app_image_picker.dart';
import 'package:meta/meta.dart';

part 'add_story_pick_image_event.dart';
part 'add_story_pick_image_state.dart';

class AddStoryPickImageBloc extends Bloc<AddStoryPickImageEvent, AddStoryPickImageState> {
  AddStoryPickImageBloc() : super(AddStoryPickImageInitial()) {
    on<AddStoryPickImageEvent>((event, emit) {
      if (event is ActionPickImage) {
        actionPickImageFunc(event);
      }
    });
  }

  Future<void> actionPickImageFunc(ActionPickImage event) async {
    try {
      File? output = await AppImagePickerService.getImageAsFile();
      if (output != null) {
        emit(AddStoryPickImageSuccess(output: output));
      } else {
        emit(AddStoryPickImageFailed(errorMessage: 'Pick Image Cancelled'));
      }
    } catch (e) {
      emit(AddStoryPickImageFailed(errorMessage: e.toString()));
    }
  }
}
