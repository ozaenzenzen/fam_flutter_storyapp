import 'package:fam_flutter_storyapp/presentation/handler/router_delegate.dart';
import 'package:fam_flutter_storyapp/presentation/handler/router_information_parser.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/check_islogin_bloc/check_islogin_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/login_bloc/login_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/show_password_login_bloc/show_password_login_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/logout_page/bloc/logout_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/main_page/get_all_story_bloc/get_all_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/register_bloc/register_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/show_password_register_bloc/show_password_register_bloc.dart';
import 'package:fam_flutter_storyapp/support/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'presentation/page/detail_story_page/get_detail_story_bloc/get_detail_story_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouterDelegate appRouterDelegate;
  late AppRouteInformationParser appRouteInformationParser;

  @override
  void initState() {
    super.initState();
    appRouteInformationParser = AppRouteInformationParser();
    appRouterDelegate = AppRouterDelegate();
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
          create: (context) => GetAllStoryBloc(),
        ),
        BlocProvider(
          create: (context) => GetDetailStoryBloc(),
        ),
      ],
      child: ChangeNotifierProvider<LocalizationProvider>(
          create: (context) => LocalizationProvider(),
          builder: (context, child) {
            final providerLocale = Provider.of<LocalizationProvider>(context);
            return ScreenUtilInit(
              // designSize: const Size(360, 690),
              designSize: const Size(411, 869),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'FAM - Story App',
                  theme: ThemeData(
                    useMaterial3: true,
                  ),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  routeInformationParser: appRouteInformationParser,
                  locale: providerLocale.locale,
                  routerDelegate: appRouterDelegate,
                  backButtonDispatcher: RootBackButtonDispatcher(),
                  // home: BlocBuilder(
                  //   bloc: context.read<CheckIsloginBloc>()..add(ActionCheckIslogin()),
                  //   builder: (context, state) {
                  //     if (state is CheckIsloginFalse) {
                  //       return const LoginPage();
                  //     } else {
                  //       return const MainPage();
                  //     }
                  //   },
                  // ),
                );
              },
            );
          }),
    );
  }
}
