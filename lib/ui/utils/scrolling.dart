import 'package:flutter/widgets.dart';

ScrollController createLoadMoreController({
  void Function()? onLoadMore,
}) {
  final controller = ScrollController();
  controller.addListener(() {
    if (controller.position.pixels ==
        controller.position.maxScrollExtent - 200) {
      onLoadMore?.call();
    }
  });
  return controller;
}
