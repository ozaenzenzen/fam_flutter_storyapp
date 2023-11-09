import 'package:fam_flutter_storyapp/data/model/response/get_all_story_response_model.dart';
import 'package:fam_flutter_storyapp/presentation/page/logout_page/bloc/logout_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/main_page/get_all_story_bloc/get_all_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/settings_page/settings_page.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  final Function(String)? onTapToDetail;
  final Function()? onAddStory;
  final Function()? onSettings;
  final Function()? onLogout;

  const MainPage({
    super.key,
    this.onTapToDetail,
    this.onLogout,
    this.onSettings,
    this.onAddStory,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ScrollController scrollController = ScrollController();

  int pageItems = 1;
  int sizeItems = 10;

  onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    if (currentScroll >= (maxScroll * 0.9)) {
      getAllStoryBloc.add(ActionGetAllStory(
        actionGetAllStoryType: ActionGetAllStoryType.infiniteScroll,
        // page: "1",
        // size: "10",
        location: "1",
      ));
    }
  }

  onScrollV1() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
      if (getAllStoryBloc.pageItems != null) {
        getAllStoryBloc.add(ActionGetAllStory(
          actionGetAllStoryType: ActionGetAllStoryType.infiniteScroll,
          // page: "1",
          // size: "10",
          location: "1",
        ));
      }
    }
  }

  onScrollV2() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      // debugPrint('reach the bottom');
      getAllStoryBloc.add(ActionGetAllStory(
        actionGetAllStoryType: ActionGetAllStoryType.infiniteScroll,
        // page: "1",
        // size: "10",
        location: "1",
      ));
    }
    if (scrollController.offset <= scrollController.position.minScrollExtent && !scrollController.position.outOfRange) {
      debugPrint('reach the top');
    }
  }

  late GetAllStoryBloc getAllStoryBloc;

  @override
  void initState() {
    super.initState();
    getAllStoryBloc = GetAllStoryBloc();
    scrollController.addListener(onScrollV1);
    getAllStoryBloc.add(ActionGetAllStory());
  }

  @override
  void dispose() {
    super.dispose();
    scrollController
      ..removeListener(onScrollV2)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getAllStoryBloc,
      child: BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            widget.onLogout?.call();
          }
        },
        child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
            appBar: AppAppBarWidget(
              title: 'FAM - Story App',
              automaticallyImplyLeading: false,
              actions: [
                InkWell(
                  onTap: () {
                    widget.onSettings?.call();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    child: const Icon(
                      Icons.menu_outlined,
                    ),
                  ),
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                // context.read<GetAllStoryBloc>().add(ActionGetAllStory());
                // getAllStoryBloc.listStoryHolder.clear();
                // getAllStoryBloc.listStoryHolder = [];
                getAllStoryBloc.add(ActionGetAllStory());
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.w,
                ),
                child: BlocConsumer<GetAllStoryBloc, GetAllStoryState>(
                  listener: (context, state) async {
                    if (state is GetAllStorySuccess) {
                      if (getAllStoryBloc.actionGetAllStoryType == ActionGetAllStoryType.infiniteScroll) {
                        await Future.delayed(const Duration(milliseconds: 10)).then((value) {
                          scrollController.jumpTo(scrollController.position.maxScrollExtent * 0.87);
                        });
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is GetAllStoryLoading && getAllStoryBloc.actionGetAllStoryType == ActionGetAllStoryType.refresh) {
                      return loadingState();
                    }
                    List<ListStory> listStoryViewHandler = [];
                    bool isLoading = false;

                    if (state is GetAllStoryLoading) {
                      listStoryViewHandler = state.listStory;
                      isLoading = true;
                    } else if (state is GetAllStorySuccess) {
                      listStoryViewHandler = state.listStory;
                    }
                    // if (state is GetAllStorySuccess) {
                    return successState(listStoryViewHandler);
                    // }
                    // else {
                    //   return emptyState();
                    // }
                  },
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            floatingActionButton: floatingActionButtonWidget(),
          ),
        ),
      ),
    );
  }

  Widget successState(List<ListStory> listStory) {
    return ListView.separated(
      controller: scrollController,
      itemCount: listStory.length + (getAllStoryBloc.pageItems != null ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == getAllStoryBloc.listStoryHolder.length && getAllStoryBloc.pageItems != null) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            ),
          );
        }
        return InkWell(
          onTap: () {
            widget.onTapToDetail?.call(listStory[index].id!);
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
                  "${listStory[index].photoUrl}",
                  height: 150.h,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: 160.h,
                      child: Center(
                        child: Text(
                          "Something's wrong, please reload",
                          style: GoogleFonts.inter(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${(index + 1)}. ${listStory[index].name}",
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "${listStory[index].description}",
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
  }

  Widget emptyState() {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget loadingState() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      // controller: scrollController,
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
  }

  Widget floatingActionButtonWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.extended(
          label: Row(
            children: [
              Text(
                // "Add Story",
                AppLocalizations.of(context)!.textAddStory,
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
            widget.onAddStory?.call();
          },
          tooltip: 'Increment',
        ),
        SizedBox(height: 20.h),
        FloatingActionButton.extended(
          label: Row(
            children: [
              Text(
                // "Logout",
                AppLocalizations.of(context)!.textLogout,
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
    );
  }
}
