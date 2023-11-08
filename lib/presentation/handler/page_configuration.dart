class PageConfiguration {
  final bool unknown;
  final bool register;
  final bool? loggedIn;
  final String? idStory;

  PageConfiguration.splash()
      : unknown = false,
        register = false,
        loggedIn = null,
        idStory = null;

  PageConfiguration.login()
      : unknown = false,
        register = false,
        loggedIn = false,
        idStory = null;

  PageConfiguration.register()
      : unknown = false,
        register = true,
        loggedIn = false,
        idStory = null;

  PageConfiguration.home()
      : unknown = false,
        register = false,
        loggedIn = true,
        idStory = null;

  PageConfiguration.detailStory(String id)
      : unknown = false,
        register = false,
        loggedIn = true,
        idStory = id;

  PageConfiguration.unknown()
      : unknown = true,
        register = false,
        loggedIn = null,
        idStory = null;

  bool get isSplashPage => unknown == false && loggedIn == null;
  bool get isLoginPage => unknown == false && loggedIn == false;
  bool get isHomePage => unknown == false && loggedIn == true && idStory == null;
  bool get isDetailPage => unknown == false && loggedIn == true && idStory != null;
  bool get isRegisterPage => register == true;
  bool get isUnknownPage => unknown == true;
}


// class PageConfiguration {
//   final bool unknown;
//   final bool register;
//   final bool? loggedIn;
//   final bool? addStoryOn;
//   final bool? settingsOn;
//   final String? idStory;

//   PageConfiguration.splash()
//       : unknown = false,
//         register = false,
//         loggedIn = null,
//         addStoryOn = false,
//         settingsOn = false,
//         idStory = null;

//   PageConfiguration.login()
//       : unknown = false,
//         register = false,
//         loggedIn = false,
//         addStoryOn = false,
//         settingsOn = false,
//         idStory = null;

//   PageConfiguration.register()
//       : unknown = false,
//         register = true,
//         loggedIn = false,
//         addStoryOn = false,
//         settingsOn = false,
//         idStory = null;

//   PageConfiguration.home()
//       : unknown = false,
//         register = false,
//         loggedIn = true,
//         addStoryOn = false,
//         settingsOn = false,
//         idStory = null;

//   PageConfiguration.detailStory(String id)
//       : unknown = false,
//         register = false,
//         loggedIn = true,
//         addStoryOn = false,
//         settingsOn = false,
//         idStory = id;

//   PageConfiguration.settingsPage()
//       : unknown = false,
//         register = false,
//         loggedIn = true,
//         addStoryOn = false,
//         settingsOn = true,
//         idStory = null;

//   PageConfiguration.addStory()
//       : unknown = false,
//         register = false,
//         loggedIn = true,
//         addStoryOn = true,
//         settingsOn = false,
//         idStory = null;

//   PageConfiguration.unknown()
//       : unknown = true,
//         register = false,
//         loggedIn = null,
//         addStoryOn = false,
//         settingsOn = false,
//         idStory = null;

//   bool get isSplashPage => unknown == false && loggedIn == null;
//   bool get isLoginPage => unknown == false && loggedIn == false;
//   bool get isHomePage => unknown == false && loggedIn == true && idStory == null;
//   bool get isDetailPage => unknown == false && loggedIn == true && idStory != null;
//   bool get isRegisterPage => register == true;
//   bool get isSettingsPage => unknown == false && loggedIn == true && settingsOn == true && addStoryOn == false;
//   bool get isAddStoryPage => unknown == false && loggedIn == true && settingsOn == false && addStoryOn == true;
//   bool get isUnknownPage => unknown == true;
// }
