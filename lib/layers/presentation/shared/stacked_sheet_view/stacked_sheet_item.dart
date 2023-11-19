import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_controller.dart';

/// A typedef representing a function that builds a widget with a [BuildContext] and a [StackedSheetController].
///
/// This typedef is commonly used for builder functions within the StackedSheetItem class,
/// providing a consistent signature for functions that build widgets based on the context and controller.
///
/// - [context]: The build context in which the widget is being built.
/// - [controller]: The StackedSheetController associated with the StackedSheetView.
///
typedef WidgetBuilder = Widget Function(
  BuildContext context,
  StackedSheetController controller,
);

/// A class representing an item in the StackedSheetView.
///
/// Each StackedSheetItem contains builders for the call to action, collapsed widget, and body.
/// Additionally, it defines the height of the collapsed widget.
class StackedSheetItem {
  /// A builder function for the call-to-action widget at the bottom of the expanded sheet.
  final WidgetBuilder callToActionBuilder;

  /// A builder function for the collapsed widget displayed when the sheet is closed.
  final WidgetBuilder collapsedWidgetBuilder;

  /// A builder function for the body of the expanded sheet.
  final WidgetBuilder bodyBuilder;

  /// The height of the collapsed widget when the sheet is closed.
  final double collapsedWidgetHeight;

  /// Constructs a [StackedSheetItem] with required builders and an optional collapsed widget height.
  ///
  /// - [callToActionBuilder]: A builder function for the call-to-action widget.
  /// - [collapsedWidgetBuilder]: A builder function for the collapsed widget.
  /// - [bodyBuilder]: A builder function for the body of the expanded sheet.
  /// - [collapsedWidgetHeight]: The height of the collapsed widget when the sheet is closed. Default is 100.
  ///
  /// Example:
  /// ```dart
  /// StackedSheetItem(
  ///   callToActionBuilder: (context, controller) => CallToActionButton(),
  ///   collapsedWidgetBuilder: (context, controller) => CollapsedWidget(),
  ///   bodyBuilder: (context, controller) => ExpandedSheetBody(),
  ///   collapsedWidgetHeight: 120,
  /// );
  /// ```
  const StackedSheetItem({
    required this.callToActionBuilder,
    required this.collapsedWidgetBuilder,
    required this.bodyBuilder,
    this.collapsedWidgetHeight = 100,
  });
}
