import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'error_viewmodel.dart';

class ErrorView extends StackedView<ErrorViewModel> {
  const ErrorView({Key? key, required this.errorDetails}) : super(key: key);
  final String errorDetails;

  @override
  Widget builder(
      BuildContext context, ErrorViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text(errorDetails.toString())),
      ),
    );
  }

  @override
  ErrorViewModel viewModelBuilder(BuildContext context) => ErrorViewModel();
}
