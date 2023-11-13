import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fam_flutter_storyapp/data/model/request/add_story_request_model.dart';
import 'package:fam_flutter_storyapp/env.dart';
import 'package:fam_flutter_storyapp/presentation/page/add_story_page/add_story_bloc/add_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/add_story_page/add_story_pick_image_bloc/add_story_pick_image_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_mainbutton_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_screen_loading_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_secondarybutton_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_textfield_widget.dart';
import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:fam_flutter_storyapp/support/app_dialog_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddStoryPage extends StatefulWidget {
  final Function()? onBack;
  final Function(BuildContext context)? actionCallback;
  final Function()? routeToMapsPage;

  const AddStoryPage({
    super.key,
    this.onBack,
    this.actionCallback,
    this.routeToMapsPage,
  });

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  TextEditingController descriptionTextFieldController = TextEditingController();
  File? imageChosen;

  late AddStoryPickImageBloc addStoryPickImageBloc;
  late AddStoryBloc addStoryBloc;

  @override
  void initState() {
    addStoryPickImageBloc = AddStoryPickImageBloc();
    addStoryBloc = AddStoryBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppAppBarWidget(
          // title: 'Add New Story',
          title: AppLocalizations.of(context)!.textAddNewStory,
          onBack: () {
            widget.onBack?.call();
          },
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose your location",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    AppSecondaryButtonWidget(
                      onPressed: () {
                        if (EnvironmentConfig.flavor != Flavor.production) {
                          AppDialogAction.showFailedPopup(
                            context: context,
                            title: AppLocalizations.of(context)!.textTitlePopupFailed,
                            description: AppLocalizations.of(context)!.descBuildVariantWarning,
                            buttonTitle: AppLocalizations.of(context)!.btnBack,
                          );
                        } else {
                          widget.routeToMapsPage?.call();
                        }
                      },
                      text: 'Choose your location',
                      color: EnvironmentConfig.flavor == Flavor.production ? null : AppColor.disabled,
                      borderColor: EnvironmentConfig.flavor == Flavor.production ? null : AppColor.disabled,
                      textColor: EnvironmentConfig.flavor == Flavor.production ? null : Colors.white,
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        chooseImageSource();
                      },
                      child: BlocProvider(
                        create: (context) => addStoryPickImageBloc,
                        child: BlocBuilder<AddStoryPickImageBloc, AddStoryPickImageState>(
                          builder: (context, state) {
                            if (state is AddStoryPickImageSuccess) {
                              return Image.memory(
                                state.output.readAsBytesSync(),
                                height: 160.h,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              );
                            } else if (state is AddStoryPickImageLoading) {
                              return SkeletonLine(
                                style: SkeletonLineStyle(
                                  height: 160.h,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              );
                            } else {
                              return DottedBorder(
                                radius: const Radius.circular(20),
                                dashPattern: const [7, 3],
                                strokeWidth: 2,
                                color: AppColor.blue,
                                child: Container(
                                  height: 200.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: AppColor.border,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.file_upload_outlined,
                                        size: 24.h,
                                        color: AppColor.blue,
                                      ),
                                      SizedBox(width: 18.h),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // "Browse File",
                                            AppLocalizations.of(context)!.textBrowseFile,
                                            style: GoogleFonts.inter(
                                              decoration: TextDecoration.underline,
                                              fontWeight: FontWeight.w700,
                                              color: AppColor.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AppTextFieldWidget(
                      // textFieldTitle: "Description",
                      // textFieldHintText: "Description",
                      textFieldTitle: AppLocalizations.of(context)!.textDescription,
                      textFieldHintText: AppLocalizations.of(context)!.textDescription,
                      controller: descriptionTextFieldController,
                      maxLines: 6,
                    ),
                    SizedBox(height: 20.h),
                    BlocProvider(
                      create: (context) => addStoryPickImageBloc,
                      child: BlocBuilder<AddStoryPickImageBloc, AddStoryPickImageState>(
                        builder: (context, state) {
                          if (state is AddStoryPickImageSuccess) {
                            imageChosen = state.output;
                            return AppMainButtonWidget(
                              onPressed: () {
                                if (imageChosen == null || descriptionTextFieldController.text.isEmpty) {
                                  AppDialogAction.showFailedPopup(
                                    context: context,
                                    // title: "Something's wrong",
                                    // description: "Some field required is not filled",
                                    // buttonTitle: "Back",
                                    title: AppLocalizations.of(context)!.textTitlePopupFailed,
                                    description: AppLocalizations.of(context)!.textDescriptionPopupFailed1,
                                    buttonTitle: AppLocalizations.of(context)!.btnBack,
                                  );
                                } else {
                                  addStoryBloc.add(
                                    ActionAddStory(
                                      addStoryRequestModel: AddStoryRequestModel(
                                        description: descriptionTextFieldController.text,
                                        // photo: MultipartFile.fromBytes(imageChosen!.path.codeUnits),
                                        photo: imageChosen!,
                                        lat: -6.3343434,
                                        lon: -6.3343434,
                                      ),
                                    ),
                                  );
                                }
                              },
                              // text: "Submit",
                              text: AppLocalizations.of(context)!.textSubmit,
                            );
                          } else {
                            return AppMainButtonWidget(
                              onPressed: () {
                                if (imageChosen == null || descriptionTextFieldController.text.isEmpty) {
                                  AppDialogAction.showFailedPopup(
                                    context: context,
                                    // title: "Something's wrong",
                                    // description: "Some field required is not filled",
                                    // buttonTitle: "Back",
                                    title: AppLocalizations.of(context)!.textTitlePopupFailed,
                                    description: AppLocalizations.of(context)!.textDescriptionPopupFailed1,
                                    buttonTitle: AppLocalizations.of(context)!.btnBack,
                                  );
                                } else {
                                  addStoryBloc.add(
                                    ActionAddStory(
                                      addStoryRequestModel: AddStoryRequestModel(
                                        description: descriptionTextFieldController.text,
                                        // photo: MultipartFile.fromBytes(imageChosen!.path.codeUnits),
                                        photo: imageChosen!,
                                        lat: -6.3343434,
                                        lon: -6.3343434,
                                      ),
                                    ),
                                  );
                                }
                              },
                              // text: "Submit",
                              text: AppLocalizations.of(context)!.textSubmit,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            loadingState(),
          ],
        ),
      ),
    );
  }

  Widget loadingState() {
    return BlocProvider(
      create: (context) => addStoryBloc,
      child: BlocConsumer<AddStoryBloc, AddStoryState>(
        builder: (context, state) {
          if (state is AddStoryLoading) {
            return const AppScreenLoadingWidget();
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {
          if (state is AddStoryFailed) {
            AppDialogAction.showFailedPopup(
              context: context,
              // title: "Something's wrong",
              title: AppLocalizations.of(context)!.textTitlePopupFailed,
              description: state.errorMessage,
              // buttonTitle: "Back",
              buttonTitle: AppLocalizations.of(context)!.btnBack,
            );
          }
          if (state is AddStorySuccess) {
            widget.actionCallback?.call(context);
          }
        },
      ),
    );
  }

  chooseImageSource() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.h),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  addStoryPickImageBloc.add(ActionPickImage(type: ImageSource.gallery));
                },
                child: Container(
                  // height: 120.h,
                  width: 120.h,
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.image,
                        size: 50.h,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "From Gallery",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              InkWell(
                onTap: () async {
                  addStoryPickImageBloc.add(ActionPickImage(type: ImageSource.camera));
                },
                child: Container(
                  // height: 120.h,
                  width: 120.h,
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera,
                        size: 50.h,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "From Camera",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // child: Text("Bottom Sheet"),
        );
      },
    );
  }
}
