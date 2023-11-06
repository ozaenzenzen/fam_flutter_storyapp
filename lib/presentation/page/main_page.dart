import 'package:fam_flutter_storyapp/presentation/page/add_story_page/add_story_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/login_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/logout_page/bloc/logout_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          body: Container(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                // onPressed: incrementCounter,
                heroTag: "btn1",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddStoryPage();
                      },
                    ),
                  );
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              SizedBox(height: 20.h),
              FloatingActionButton(
                heroTag: "btn2",
                onPressed: () {
                  context.read<LogoutBloc>().add(ActionLogout());
                },
                tooltip: 'Logout',
                child: const Icon(Icons.exit_to_app),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
