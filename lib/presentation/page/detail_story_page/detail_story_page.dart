import 'package:fam_flutter_storyapp/presentation/page/detail_story_page/get_detail_story_bloc/get_detail_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

class DetailStoryPage extends StatefulWidget {
  final String idStory;

  const DetailStoryPage({
    super.key,
    required this.idStory,
  });

  @override
  State<DetailStoryPage> createState() => _DetailStoryPageState();
}

class _DetailStoryPageState extends State<DetailStoryPage> {
  @override
  void initState() {
    BlocProvider.of<GetDetailStoryBloc>(context).add(ActionGetDetailStory(
      idStory: widget.idStory,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBarWidget(
        title: "Detail Story",
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<GetDetailStoryBloc, GetDetailStoryState>(
                builder: (context, state) {
                  if (state is GetDetailStoryLoading) {
                    return SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 150.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  } else if (state is GetDetailStorySuccess) {
                    return Image.network(
                      "${state.getDetailStoryResponseModel.story?.photoUrl}",
                      // height: 150.h,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(height: 20.h),
              BlocBuilder<GetDetailStoryBloc, GetDetailStoryState>(
                builder: (context, state) {
                  if (state is GetDetailStoryLoading) {
                    return SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 40.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  } else if (state is GetDetailStorySuccess) {
                    return Text(
                      '${state.getDetailStoryResponseModel.story?.name}',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(height: 10.h),
              BlocBuilder<GetDetailStoryBloc, GetDetailStoryState>(
                builder: (context, state) {
                  if (state is GetDetailStoryLoading) {
                    return SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 40.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  } else if (state is GetDetailStorySuccess) {
                    return Text(
                      '${state.getDetailStoryResponseModel.story?.description}',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
