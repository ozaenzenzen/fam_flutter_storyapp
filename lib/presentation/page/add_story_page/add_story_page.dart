import 'package:dotted_border/dotted_border.dart';
import 'package:fam_flutter_storyapp/data/model/request/add_story_request_model.dart';
import 'package:fam_flutter_storyapp/presentation/page/add_story_page/add_story_bloc/add_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/add_story_page/add_story_pick_image_bloc/add_story_pick_image_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_mainbutton_widget.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_textfield_widget.dart';
import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

class AddStoryPage extends StatefulWidget {
  const AddStoryPage({super.key});

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  TextEditingController descriptionTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBarWidget(
        title: 'Add New Story',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.read<AddStoryPickImageBloc>().add(ActionPickImage());
                },
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
                                    "Browse File",
                                    style: GoogleFonts.inter(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.blue,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "Format dokumen .jpg",
                                    style: GoogleFonts.inter(
                                      color: AppColor.disabled,
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
              SizedBox(height: 40.h),
              AppTextFieldWidget(
                textFieldTitle: "Description",
                textFieldHintText: "Description",
                controller: descriptionTextFieldController,
                maxLines: 6,
              ),
              SizedBox(height: 20.h),
              AppMainButtonWidget(
                onPressed: () {
                  // context.read<AddStoryBloc>().add(
                  //       ActionAddStory(
                  //         addStoryRequestModel: AddStoryRequestModel(
                  //           description: descriptionTextFieldController.text,
                  //           photo: photo,
                  //           lat: -6.3343434,
                  //           lon: -6.3343434,
                  //         ),
                  //       ),
                  //     );
                },
                text: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
