import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/services/authentication_service.dart';
import 'package:antonx_flutter_boilerplate_3/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.locator.dart';
import 'package:antonx_flutter_boilerplate_3/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _localStorageService = locator<LocalStorageService>();
  // final _notificationService = locator<NotificationsService>();

  StartupViewModel() {
    _initialSetup();
  }

  _initialSetup() async {
    await _localStorageService.init();

    ///
    /// If not connected to internet, show an alert dialog
    /// to activate the network connection.
    ///
    // final connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult == ConnectivityResult.none) {
    //   Get.dialog(const NetworkErrorDialog());
    //   return;
    // }

    ///
    ///initializing notification services
    ///

    // await _notificationService.initConfigure();

    ///
    /// Use the below [_getOnboardingData] method if the
    /// onboarding is dynamic (Means onboarding data coming from
    /// the apis)
    ///
    onboardingList = await _getOnboardingData();

    ///
    /// Routing to the last onboarding screen user seen
    ///
    if (_localStorageService.onBoardingPageCount + 1 < onboardingList.length) {
      ///
      /// For better user experience we precache onboarding images in case
      /// they are coming from a remote server.
      /// Remove it if onboarding is static.
      ///
      // ! UNCOMMENT THE FOLLOWING WHEN YOU ARE USING HTE ONBOARDING
      // ! PAGES
      // final List<Image> preCachedImages =
      // await _preCacheOnboardingImages(onboardingList);
      // await Get.to(() => OnboardingScreen(
      //     currentIndex: _localStorageService.onBoardingPageCount,
      //     onboardingList: onboardingList,
      //     preCachedImages: preCachedImages));
      return;
    }
    // await _authService.doSetup();

    ///
    ///checking if the user is login or not
    ///
    // log.d('@_initialSetup. Login State: ${_authService.isLogin}');
    // if (_authService.isLogin) {
    //   Get.off(() => const RootScreen());
    // } else {
    //   Get.off(() => LoginScreen());
    // }
  }

  List<Widget> onboardingList = [];
  final log = getLogger('Splash Screen');

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }

  _getOnboardingData() async {
    ///uncomment below code

    // final response = await _dbService.getOnboardingData();
    // if (response.success) {
    //   return response.onboardingsList;
    // } else {
    //   return [];
    // }
    List<Widget> onboardings = [];
    return onboardings;
  }
}
