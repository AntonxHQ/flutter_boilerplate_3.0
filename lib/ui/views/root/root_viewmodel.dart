import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/conversation/conversation_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/home/home_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/map/map_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/profile/profile_view.dart';
import 'package:antonx_flutter_boilerplate_3/ui/views/root/root_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class RootViewModel extends BaseViewModel {
  var log = getLogger("RootViewModel");

  int selectedIndex = 0;

  getCurrentIndex(state) {
    log.wtf(state.fullPath);
    return state.fullPath?.contains("/home") ?? false
        ? 0
        : state.fullPath?.contains("/conversation") ?? false
            ? 1
            : state.fullPath?.contains("/map") ?? false
                ? 2
                : state.fullPath?.contains("/profile") ?? false
                    ? 3
                    : 0;
  }

  void goOtherTab(BuildContext context, int index) {
    log.wtf(index);
    selectedIndex = index;
    GoRouter router = GoRouter.of(context);
    String location = tabs[index].initialLocation;
    log.wtf(location);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      router.go(location);
    });
    rebuildUi();
  }

  static const List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: 'home',
      initialLocation: '/home',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.chat),
      activeIcon: Icon(Icons.chat),
      label: 'chat',
      initialLocation: '/conversation',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.map),
      activeIcon: Icon(Icons.map),
      label: 'map',
      initialLocation: '/map',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.map),
      label: 'profile',
      initialLocation: '/profile',
    ),
  ];

  static List<Widget> screens = [
    HomeView(),
    const ConversationView(),
    const MapView(),
    const ProfileView(),
  ];

  get allScreens => screens;

  get allTabs => tabs;
}
