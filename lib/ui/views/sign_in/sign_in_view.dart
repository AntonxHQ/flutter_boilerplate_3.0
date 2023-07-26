import 'package:antonx_flutter_boilerplate_3/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sign_in_viewmodel.dart';

class SignInView extends StackedView<SignInViewModel> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignInViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    const Text(
                      'You need to Login on this page!',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color: Colors.black,
                      onPressed: viewModel.navigateToHomeScreen,
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    verticalSpaceMassive,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignInViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInViewModel();
}
