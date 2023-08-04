import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'root_viewmodel.dart';

// ignore: must_be_immutable
class RootView extends StackedView<RootViewModel> {
  RootView({
    Key? key,
    required this.widget,
    required this.state,
  }) : super(key: key);
  final Widget widget;
  final GoRouterState state;
  var log = getLogger("Root");
  @override
  Widget builder(BuildContext context, RootViewModel viewModel, Widget? child) {
    // log.wtf(widget);
    return Scaffold(
      backgroundColor: kcWhiteColor,
      body: widget,
      // viewModel.allScreens[viewModel.selectedIndex],
      // key: widget.key,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kcBlueColor,
        unselectedItemColor: kcGreyColor,
        currentIndex:
            // viewModel.selectedIndex,
            viewModel.getCurrentIndex(state),
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        onTap: (index) {
          viewModel.goOtherTab(context, index);
        },
        items: viewModel.allTabs,
      ),
    );
  }

  @override
  RootViewModel viewModelBuilder(BuildContext context) => RootViewModel();
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const MyCustomBottomNavBarItem(
      {required this.initialLocation,
      required Widget icon,
      String? label,
      Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}
