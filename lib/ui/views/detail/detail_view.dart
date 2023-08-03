import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import 'detail_viewmodel.dart';

class DetailView extends StackedView<DetailViewModel> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, DetailViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text("Detail VIew"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Center(
            child: Text(
          "Detail View",
          style: Theme.of(context).textTheme.bodyMedium,
        )),
      ),
    );
  }

  @override
  DetailViewModel viewModelBuilder(BuildContext context) => DetailViewModel();
}
