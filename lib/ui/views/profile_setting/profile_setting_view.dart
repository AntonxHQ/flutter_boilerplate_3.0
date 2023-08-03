import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_setting_viewmodel.dart';

class ProfileSettingView extends StackedView<ProfileSettingViewModel> {
  const ProfileSettingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileSettingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child:  Text("Profile Setting View")),
      ),
    );
  }

  @override
  ProfileSettingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileSettingViewModel();
}
