import 'package:fam_flutter_storyapp/presentation/page/add_story_page/add_story_bloc/add_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/add_story_page/add_story_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/detail_story_page/detail_story_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/login_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/logout_page/bloc/logout_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/main_page/get_all_story_bloc/get_all_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    BlocProvider.of<GetAllStoryBloc>(context).add(ActionGetAllStory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ),
            (route) => false,
          );
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: const AppAppBarWidget(
            title: 'FAM - Story App',
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<GetAllStoryBloc>().add(ActionGetAllStory());
            },
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.w,
                ),
                child: BlocBuilder<GetAllStoryBloc, GetAllStoryState>(
                  builder: (context, state) {
                    if (state is GetAllStoryLoading) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 200.h,
                              width: MediaQuery.of(context).size.width,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 16.h,
                          );
                        },
                      );
                    } else if (state is GetAllStorySuccess) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.getAllStoryResponseModel.listStory == null ? 0 : state.getAllStoryResponseModel.listStory!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailStoryPage(
                                      idStory: state.getAllStoryResponseModel.listStory![index].id!,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 0.5,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    // "https://dicoding-web-img.sgp1.cdn.digitaloceanspaces.com/original/academy/dos:09d7500d142537d6479e229314b143be20230106150604.jpeg",
                                    "${state.getAllStoryResponseModel.listStory![index].photoUrl}",
                                    height: 150.h,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                  // SizedBox(height: 5.h),
                                  Container(
                                    padding: EdgeInsets.all(12.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // "Title",
                                          "${state.getAllStoryResponseModel.listStory![index].name}",
                                          style: GoogleFonts.inter(
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          // "Note for advanced developers: If you prefer not to use a routing package and would like full control over navigation and routing in your app, override RouteInformationParser and RouterDelegate. When the state in your app changes, you can precisely control the stack of screens by providing a list of Page objects using the Navigator.pages parameter. For more details, see the Router API documentation.",
                                          "${state.getAllStoryResponseModel.listStory![index].description}",
                                          style: GoogleFonts.inter(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 16.h,
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton.extended(
                label: Row(
                  children: [
                    Text(
                      "Add Story",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ],
                ),
                heroTag: "btn1",
                backgroundColor: AppColor.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddStoryPage(
                          actionCallback: () {
                            Navigator.pop(context);
                            context.read<GetAllStoryBloc>().add(ActionGetAllStory());
                          },
                        );
                      },
                    ),
                  );
                },
                tooltip: 'Increment',
              ),
              SizedBox(height: 20.h),
              FloatingActionButton.extended(
                label: Row(
                  children: [
                    Text(
                      "Logout",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                  ],
                ),
                heroTag: "btn2",
                backgroundColor: AppColor.primary,
                onPressed: () {
                  context.read<LogoutBloc>().add(ActionLogout());
                },
                tooltip: 'Logout',
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
