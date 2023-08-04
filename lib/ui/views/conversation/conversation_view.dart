import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'conversation_viewmodel.dart';

class ConversationView extends StackedView<ConversationViewModel> {
  const ConversationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConversationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Center(
          child: Text(
            "Conversation View",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }

  @override
  ConversationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConversationViewModel();
}
