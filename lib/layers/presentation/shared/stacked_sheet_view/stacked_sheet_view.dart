// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_controller.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_options.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

typedef WidgetBuilder = Widget Function(
    BuildContext context, StackedSheetController controller);

class StackedSheetView extends StatefulWidget {
  final Widget closedChild;
  final List<StackedSheetItem> items;
  final StackedSheetController controller;
  final StackedSheetOptions options;
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

  List<Widget> _prepareSheets(BuildContext context) {
    final List<Widget> sheets = [];
    for (var i = 0; i < widget.controller.totalSheets; i++) {
      final sheetIndex = i;
      final sheet = ValueListenableBuilder<int>(
        valueListenable: widget.controller,
        builder: (context, currentSheetIndex, child) {
          if (currentSheetIndex < 0 || !widget.controller.isSheetOpened(sheetIndex)) return const SizedBox.shrink();
          final isCollapsed = currentSheetIndex > sheetIndex;

          final item = widget.items[sheetIndex];

          double position = -140;

          double top = -position + (item.collapsedWidgetHeight * sheetIndex);

          List<Effect> sheetEffects = [];

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

          return Positioned.fill(
            // duration: 400.milliseconds,
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
                      duration: options.animationDuration ??
                          appTheme.animationDuration,
                      firstChild: item.collapsedWidgetBuilder(
                          context, widget.controller),
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
                                        context, widget.controller)),
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
                    )),
              ),
            ),
          );
        },
      );

      sheets.add(sheet);
    }

    return sheets;
  }
}

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
