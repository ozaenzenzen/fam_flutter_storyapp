import 'package:fam_flutter_storyapp/presentation/page/login_page/check_islogin_bloc/check_islogin_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/login_bloc/login_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/login_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/show_password_login_bloc/show_password_login_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/logout_page/bloc/logout_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/main_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          );
        },
      ),
    );
  }
}
