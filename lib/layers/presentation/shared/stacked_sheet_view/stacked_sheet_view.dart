// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_controller.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_item.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_options.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

/// A Flutter widget representing a stacked sheet view that can be opened and closed.
class StackedSheetView extends StatefulWidget {
  /// The widget displayed when the sheet is closed.
  final Widget closedChild;

  /// The list of stacked sheet items, each representing a sheet.
  final List<StackedSheetItem> items;

  /// The controller managing the state of the stacked sheet.
  final StackedSheetController controller;

  /// Additional options for configuring the stacked sheet view.
  final StackedSheetOptions options;

  /// Constructs a [StackedSheetView].
  ///
  /// - [closedChild]: The widget displayed when the sheet is closed.
  /// - [controller]: The controller managing the state of the stacked sheet.
  /// - [items]: The list of stacked sheet items, each representing a sheet.
  /// - [options]: Additional options for configuring the stacked sheet view.
  const StackedSheetView({
    super.key,
    required this.closedChild,
    required this.controller,
    this.items = const [],
    this.options = const StackedSheetOptions.defaultOptions(),
  });

  @override
  State<StackedSheetView> createState() => _StackedSheetViewState();
}

class _StackedSheetViewState extends State<StackedSheetView> {
  late StackedSheetOptions options;

  @override
  void initState() {
    options = widget.options;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allSheets = _prepareSheets(context);

    return WillPopScope(
      onWillPop: () async {
        if (widget.controller.hasOpenSheets) {
          widget.controller.closeCurrent();
        }

        return !widget.controller.hasOpenSheets;
      },
      child: Stack(
        children: [
          widget.closedChild,
          ...allSheets,
        ],
      ),
    );
  }

  /// Prepares a list of sheet widgets based on the current state of the stacked sheet controller.
  ///
  /// The method iterates through each sheet in the controller and builds the corresponding widget
  /// based on its index and the controller's state. The resulting list of widgets represents the
  /// stacked sheets to be displayed.
  ///
  /// - [context]: The build context for the widget.
  ///
  /// Returns a list of widgets representing the stacked sheets.
  List<Widget> _prepareSheets(BuildContext context) {
    // List to store the prepared sheet widgets
    final List<Widget> sheets = [];

    // Iterate through each sheet in the controller
    for (var i = 0; i < widget.controller.totalSheets; i++) {
      final sheetIndex = i;

      // Use a ValueListenableBuilder to listen to changes in the currentSheetIndex
      final sheet = ValueListenableBuilder<int>(
        valueListenable: widget.controller,
        builder: (context, currentSheetIndex, child) {
          // If the currentSheetIndex is negative or the sheet is not opened, return an empty SizedBox
          if (currentSheetIndex < 0 ||
              !widget.controller.isSheetOpened(sheetIndex)) {
            return const SizedBox.shrink();
          }

          // Determine whether the sheet is collapsed based on the currentSheetIndex
          final isCollapsed = currentSheetIndex > sheetIndex;

          // Retrieve the sheet item for the current index
          final item = widget.items[sheetIndex];

          // Calculate the top position of the sheet
          double position = -140;
          double top = -position + (item.collapsedWidgetHeight * sheetIndex);

          // List to store animation effects for the sheet
          List<Effect> sheetEffects = [];

          // Configure animation effects based on the sheet state
          if (sheetIndex > currentSheetIndex) {
            sheetEffects = [
              MoveEffect(
                begin: const Offset(0, 0),
                end: Offset(0, 100.h),
                duration: options.sheetCloseDuration,
                curve: options.sheetCloseCurve,
              ),
            ];
          } else {
            sheetEffects = [
              MoveEffect(
                begin: Offset(0, 100.h),
                end: const Offset(0, 0),
                delay: 200.milliseconds,
                duration: options.sheetOpenDuration,
                curve: options.sheetOpenCurve,
              ),
            ];
          }

          // Build the sheet widget with animations
          return Positioned.fill(
            top: top,
            child: Animate(
              effects: sheetEffects,
              child: Material(
                color: options.sheetColor,
                shape: options.shape,
                child: SizedBox(
                  width: 100.w,
                  height: 100.h - top,
                  child: AnimatedCrossFade(
                    crossFadeState: isCollapsed
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration:
                        options.animationDuration ?? appTheme.animationDuration,
                    firstChild:
                        item.collapsedWidgetBuilder(context, widget.controller),
                    secondChild: SizedBox(
                      height: 100.h - top,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: item.bodyBuilder(
                                    context, widget.controller),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: item.callToActionBuilder(
                                context, widget.controller),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );

      // Add the prepared sheet widget to the list
      sheets.add(sheet);
    }

    // Return the list of prepared sheet widgets
    return sheets;
  }
}
