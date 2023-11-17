import 'dart:typed_data';

import 'package:fam_flutter_storyapp/data/repository/local/local_repository.dart';
import 'package:fam_flutter_storyapp/presentation/handler/page_configuration.dart';
import 'package:fam_flutter_storyapp/presentation/page/add_story_page/add_story_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/additional/splash_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/additional/unknown_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/detail_story_page/detail_story_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/login_page/login_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/main_page/get_all_story_bloc/get_all_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/page/main_page/main_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/maps_page/maps_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/register_page/register_page.dart';
import 'package:fam_flutter_storyapp/presentation/page/settings_page/settings_page.dart';
import 'package:fam_flutter_storyapp/support/app_dialog_action_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppRouterDelegate extends RouterDelegate<PageConfiguration> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  AppRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  _init() async {
    isLoggedIn = await LocalRepository.getIsLogin();
    notifyListeners();
  }

  bool? isUnknownPage;
  bool? isRegister = false;
  bool? isAddStory = false;
  bool? isSettings = false;
  bool? isMapsOpen = false;

  String? idStory;

  LatLng? latLng;
  Placemark? placemarkMap;
  String? alamat;
  Uint8List? screenshotMap;

  bool? isLoggedIn;

  List<Page> pageStack = [];

  @override
  Widget build(BuildContext context) {
    if (isUnknownPage == true) {
      pageStack = _unknownStack;
    } else if (isLoggedIn == null) {
      pageStack = _splashStack;
    } else if (isLoggedIn == true) {
      pageStack = _loginStack;
    } else {
      pageStack = _logoutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: pageStack,
      // pages: [
      //   const MaterialPage(
      //     key: ValueKey("MainPage"),
      //     child: MainPage(),
      //   ),
      //   const MaterialPage(
      //     key: ValueKey("LoginPage"),
      //     child: LoginPage(),
      //   ),
      //   const MaterialPage(
      //     key: ValueKey("RegisterPage"),
      //     child: RegisterPage(),
      //   ),
      //   const MaterialPage(
      //     key: ValueKey("AddStoryPage"),
      //     child: AddStoryPage(),
      //   ),
      //   if (idStory != null)
      //     MaterialPage(
      //       key: const ValueKey("DetailStoryPage"),
      //       child: DetailStoryPage(
      //         idStory: idStory!,
      //       ),
      //     ),
      // ],
      onPopPage: (route, result) {
        debugPrint('route apa ${route.settings}');
        if (callPopup == true) {
          return false;
        }
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        isRegister = false;
        isAddStory = false;
        isSettings = false;
        isMapsOpen = false;
        idStory = null;
        // callPopup = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  PageConfiguration? get currentConfiguration {
    debugPrint('this is current config');
    if (isLoggedIn == null) {
      return PageConfiguration.splash();
    } else if (isRegister == true) {
      return PageConfiguration.register();
    } else if (isLoggedIn == false) {
      return PageConfiguration.login();
    } else if (isUnknownPage == true) {
      return PageConfiguration.unknown();
    } else if (idStory == null) {
      return PageConfiguration.home();
    } else if (idStory != null) {
      return PageConfiguration.detailStory(idStory!);
    } else if (callPopup == true) {
      return PageConfiguration.popupPage(
        unknown: false,
        register: isRegister!,
        loggedIn: isLoggedIn,
        idStory: idStory,
        callPopup: callPopup!,
      );
    } else {
      return null;
    }
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    debugPrint('this is setNewRoutePath');
    if (configuration.isUnknownPage) {
      isUnknownPage = true;
      isRegister = false;
    } else if (configuration.isRegisterPage) {
      isRegister = true;
    } else if (configuration.isHomePage || configuration.isLoginPage || configuration.isSplashPage) {
      isUnknownPage = false;
      idStory = null;
      isRegister = false;
    } else if (configuration.isDetailPage) {
      isUnknownPage = false;
      isRegister = false;
      idStory = configuration.idStory.toString();
    } else {
      debugPrint(' Could not set new route');
    }

    notifyListeners();
  }

  List<Page> get _unknownStack => const [
        MaterialPage(
          key: ValueKey("UnknownPage"),
          child: UnknownPage(),
        ),
      ];

  List<Page> get _splashStack => const [
        MaterialPage(
          key: ValueKey("SplashPage"),
          child: SplashPage(),
        ),
      ];

  List<Page> get _logoutStack => [
        MaterialPage(
          key: const ValueKey("LoginPage"),
          child: LoginPage(
            onLogin: () {
              isLoggedIn = true;
              notifyListeners();
            },
            onRegister: () {
              isRegister = true;
              notifyListeners();
            },
            callbackPopup: (title, desc, titleButton) {
              callPopup = true;
              popupTitle = title;
              popupDesc = desc;
              popupTitleButton = titleButton;
              notifyListeners();
            },
          ),
        ),
        if (isRegister == true)
          MaterialPage(
            key: const ValueKey("RegisterPage"),
            child: RegisterPage(
              onRegister: () {
                isRegister = false;
                notifyListeners();
              },
              onLogin: () {
                isRegister = false;
                notifyListeners();
              },
              callbackPopup: (title, desc, titleButton) {
                isRegister = true;
                callPopup = true;
                popupTitle = title;
                popupDesc = desc;
                popupTitleButton = titleButton;
                notifyListeners();
              },
            ),
          ),
        if (callPopup == true)
          PopupPage(
            title: popupTitle!,
            desc: popupDesc!,
            buttonCallback: () {
              callPopup = false;
              notifyListeners();
            },
            buttonTitle: popupTitleButton!,
          ),
      ];

  BuildContext? savedGetAllStoryBlocContext;
  bool? callPopup = false;

  String? popupTitle;
  String? popupDesc;
  String? popupTitleButton;

  List<Page> get _loginStack => [
        MaterialPage(
          key: const ValueKey("MainPage"),
          child: MainPage(
            onAddStory: (BuildContext contextFromBloc) {
              isAddStory = true;
              alamat = null;
              savedGetAllStoryBlocContext = contextFromBloc;
              notifyListeners();
            },
            onTapToDetail: (String idStorycallback) {
              idStory = idStorycallback;
              notifyListeners();
            },
            onLogout: () {
              isLoggedIn = false;
              notifyListeners();
            },
            onSettings: () {
              isSettings = true;
              notifyListeners();
            },
          ),
        ),
        if (isAddStory == true)
          MaterialPage(
            key: const ValueKey("AddStoryPage"),
            child: AddStoryPage(
              callbackGetAlamat: alamat,
              callbackGetLatLong: latLng,
              callbackPopup: (title, desc, titleButton) {
                isAddStory = true;
                callPopup = true;
                popupTitle = title;
                popupDesc = desc;
                popupTitleButton = titleButton;
                notifyListeners();
              },
              onBack: () {
                isAddStory = false;
                alamat = null;
                notifyListeners();
              },
              actionCallback: (BuildContext context) {
                isAddStory = false;
                // BlocProvider.of<GetAllStoryBloc>(context, listen: false).add(ActionGetAllStory());
                BlocProvider.of<GetAllStoryBloc>(savedGetAllStoryBlocContext!, listen: false).add(ActionGetAllStory());
                notifyListeners();
              },
              onMapsOpen: () {
                isMapsOpen = true;
                notifyListeners();
              },
            ),
          ),
        if (isMapsOpen == true)
          MaterialPage(
            key: const ValueKey("MapsPage"),
            child: MapsPage(
              onBack: () {
                isMapsOpen = false;
                notifyListeners();
              },
              actionCallback: (latLngs, placemarkMap, alamats, screenshotMap) {
                alamat = alamats;
                latLng = latLngs;
                isMapsOpen = false;
                notifyListeners();
              },
            ),
          ),
        if (idStory != null)
          MaterialPage(
            key: const ValueKey("DetailStoryPage"),
            child: DetailStoryPage(
              idStory: idStory!,
            ),
          ),
        if (isSettings == true)
          MaterialPage(
            key: const ValueKey("SettingsPage"),
            child: SettingsPage(
              onBack: () {
                isSettings = false;
                notifyListeners();
              },
            ),
          ),
        if (callPopup == true)
          PopupPage(
            title: popupTitle!,
            desc: popupDesc!,
            buttonCallback: () {
              isAddStory = true;
              callPopup = false;
              notifyListeners();
            },
            buttonTitle: popupTitleButton!,
          ),
      ];
}

// import 'package:fam_flutter_storyapp/presentation/handler/app_config.dart';
// import 'package:flutter/material.dart';

// class MyRouterDelegate extends RouterDelegate<AppConfig> with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppConfig> {
//   final GlobalKey<NavigatorState> navigatorKey;

//   AppConfig currentState = AppConfig.book();
//   AppConfig previousState;
//   // for pop on User Page, to possibly go back to a specific book

//   List<Book> books = [
//     Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
//     Book('Foundation', 'Isaac Asimov'),
//     Book('Fahrenheit 451', 'Ray Bradbury'),
//   ];

//   MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
//     print("1. BookRouterDelegate initialized");
//     print(this);
//     assert(AppConfig.book() == this.currentConfiguration);
//   }

//   AppConfig get currentConfiguration {
//     return currentState;
//   }

//   List<Page<dynamic>> buildPage() {
//     List<Page<dynamic>> pages = [];
//     pages.add(
//       MaterialPage(
//         key: ValueKey('BooksListPage'),
//         child: BooksListScreen(
//           books: books,
//         ),
//       ),
//     );
//     if (currentState.uri.pathSegments[0] == AppConfig.book().uri.pathSegments[0]) {
//       if (currentState.id != null)
//         pages.add(
//           MaterialPage(key: ValueKey('BookListPageId' + currentState.id.toString()), child: BookDetailsScreen(book: books[currentState.id])),
//         );
//     } else if (currentState.uri.pathSegments[0] == AppConfig.user().uri.pathSegments[0]) {
//       pages.add(MaterialPage(
//           key: ValueKey('LoginScreen'),
//           child: UserScreen(
//             refresh: _notifyListeners,
//           )));
//     }
//     if (currentState.isUnknown) pages.add(MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen()));
//     return pages;
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("BookRouterDelegate building...");
//     print(this.currentState);
//     return Navigator(
//       key: navigatorKey,
//       //transitionDelegate: AnimationTransitionDelegate(),
//       pages: buildPage(),
//       onPopPage: (route, result) {
//         if (!route.didPop(result)) {
//           return false;
//         } else if (currentState.uri.pathSegments[0] == AppConfig.book().uri.pathSegments[0] && currentState.id != null) {
//           currentState = AppConfig.book();
//         } else if (currentState.uri.path == AppConfig.user().uri.path) {
//           currentState = previousState;
//           previousState = null;
//         } else {
//           currentState = AppConfig.unknown();
//         }
//         notifyListeners();
//         return true;
//       },
//     );
//   }

//   @override
//   Future<void> setNewRoutePath(AppConfig newState) async {
//     currentState = newState;
//     return;
//   }

//   void handleBookTapped(Book book) {
//     currentState = AppConfig.bookDetail(books.indexOf(book));
//     notifyListeners();
//   }

//   void handleUserTapped(void nulll) {
//     previousState = currentState;
//     currentState = AppConfig.user();
//     notifyListeners();
//   }

//   void _notifyListeners(void nothing) {
//     notifyListeners();

//   }
// }
