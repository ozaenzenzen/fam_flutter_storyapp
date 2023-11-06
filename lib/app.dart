import 'package:fam_flutter_storyapp/presentation/page/add_story_page/add_story_bloc/add_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/check_islogin_bloc/check_islogin_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/login_bloc/login_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/login_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/show_password_login_bloc/show_password_login_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/logout_page/bloc/logout_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/main_page/get_all_story_bloc/get_all_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/main_page/main_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/register_bloc/register_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/show_password_register_bloc/show_password_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/page/add_story_page/add_story_pick_image_bloc/add_story_pick_image_bloc.dart';
import 'presentation/page/detail_story_page/get_detail_story_bloc/get_detail_story_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => CheckIsloginBloc(),
        ),
        BlocProvider(
          create: (context) => ShowPasswordLoginBloc(),
        ),
        BlocProvider(
          create: (context) => ShowPasswordRegisterBloc(),
        ),
        BlocProvider(
          create: (context) => AddStoryBloc(),
        ),
        BlocProvider(
          create: (context) => GetAllStoryBloc(),
        ),
        BlocProvider(
          create: (context) => GetDetailStoryBloc(),
        ),
        BlocProvider(
          create: (context) => AddStoryPickImageBloc(),
        ),
      ],
      child: ScreenUtilInit(
        // designSize: const Size(360, 690),
        designSize: const Size(411, 869),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'FAM - Story App',
            theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: const MainPage(),
            // home: isLogin ? const MainPage() : const LoginPage(),
            home: BlocBuilder(
              bloc: context.read<CheckIsloginBloc>()..add(ActionCheckIslogin()),
              builder: (context, state) {
                if (state is CheckIsloginFalse) {
                  return const LoginPage();
                } else {
                  return const MainPage();
                }
              },
            ),
            // home: Navigator(
            //   pages: const [
            //     MaterialPage(
            //       key: ValueKey("MainPage"),
            //       child: MainPage(),
            //     ),
            //     MaterialPage(
            //       key: ValueKey("LoginPage"),
            //       child: LoginPage(),
            //     ),
            //     MaterialPage(
            //       key: ValueKey("RegisterPage"),
            //       child: RegisterPage(),
            //     ),
            //     MaterialPage(
            //       key: ValueKey("AddStoryPage"),
            //       child: AddStoryPage(),
            //     ),
            //   ],
            //   onPopPage: (route, result) {
            //     final didPop = route.didPop(result);
            //     if (!didPop) {
            //       return false;
            //     }

            //     return true;
            // },
            // ),
          );
        },
      ),
    );
  }
}
