import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:antonx_flutter_boilerplate_3/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'package:antonx_flutter_boilerplate_3/ui/common/app_colors.dart';
import 'package:antonx_flutter_boilerplate_3/ui/common/ui_helpers.dart';
import 'home_viewmodel.dart';

// ignore: must_be_immutable
class HomeView extends StackedView<HomeViewModel> {
  var log = getLogger("Home");

  HomeView({super.key});
  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
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
                    Text('Hello AntonX',
                        style: Theme.of(context).textTheme.headlineLarge),
                    MaterialButton(
                      color:
                          Theme.of(context).buttonTheme.colorScheme?.background,
                      onPressed: viewModel.incrementCounter,
                      child: Text(
                        viewModel.counterLabel,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color:
                          Theme.of(context).buttonTheme.colorScheme?.background,
                      onPressed: () {
                        log.wtf("detail button clicked");

                        ///
                        GoRouter.of(context)
                            .go("${AppRoutes.home}${AppRoutes.detail}");
                      },
                      child: const Text(
                        "Detail Page",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color:
                          Theme.of(context).buttonTheme.colorScheme?.background,
                      onPressed: () {
                        ///
                        GoRouter.of(context)
                            .go("${AppRoutes.conversation}${AppRoutes.chat}");
                      },
                      child: const Text(
                        "Chat View",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                verticalSpaceLarge,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     MaterialButton(
                //       minWidth: 120,
                //       color: kcLightGrey,
                //       onPressed: viewModel.showDialog,
                //       child: Text(
                //         'Show Dialog',
                //         style: Theme.of(context)
                //             .textTheme
                //             .bodyMedium
                //             ?.copyWith(fontSize: 10),
                //       ),
                //     ),
                //     MaterialButton(
                //       minWidth: 120,
                //       color: kcLightGrey,
                //       onPressed: viewModel.showBottomSheet,
                //       child: Text(
                //         'Bottom Sheet',
                //         style: Theme.of(context).textTheme.bodyMedium,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
