import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_controller.dart';

typedef WidgetBuilder = Widget Function(
    BuildContext context, StackedSheetController controller);

class StackedSheetItem {
  final WidgetBuilder callToActionBuilder;
  final WidgetBuilder collapsedWidgetBuilder;
  final WidgetBuilder bodyBuilder;
  final double collapsedWidgetHeight;
  const StackedSheetItem({
    required this.callToActionBuilder,
    required this.collapsedWidgetBuilder,
    required this.bodyBuilder,
    this.collapsedWidgetHeight = 100,
  });
}
