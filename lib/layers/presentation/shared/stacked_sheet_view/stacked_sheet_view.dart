// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_controller.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

class StackedSheetView extends StatefulWidget {
  final Widget closedChild;

  final List<StackedSheetItem> items;
  final StackedSheetController controller;
  const StackedSheetView({
    super.key,
    required this.closedChild,
    required this.controller,
    required this.items,
  });

  @override
  State<StackedSheetView> createState() => _StackedSheetViewState();
}

class _StackedSheetViewState extends State<StackedSheetView> {
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
          if (sheetIndex > currentSheetIndex) {
            return const SizedBox.shrink();
          }

          final isCollapsed = currentSheetIndex > sheetIndex;

          final item = widget.items[sheetIndex];

          double position = -90;

          final top = -position + (100.0 * sheetIndex);

          return Positioned.fill(
            top: top,
            child: Align(
              alignment: Alignment.topCenter,
              child: Material(
                child: SizedBox(
                    width: double.infinity,
                    height: 100.h - top,
                    child: AnimatedCrossFade(
                      crossFadeState: isCollapsed
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: appTheme.animationDuration,
                      firstChild: item.collapsedWidget,
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          item.body,
                          item.callToAction,
                        ],
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
  final Widget callToAction;
  final Widget collapsedWidget;
  final Widget body;
  const StackedSheetItem({
    required this.callToAction,
    required this.collapsedWidget,
    required this.body,
  });
}

// class _StackedSheetItemState  {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: appTheme.primaryInverseColor,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//       ),
//       elevation: 1,
//       child: Container(
//         padding: EdgeInsets.all(appTheme.paddingUnit),
//         decoration: BoxDecoration(
//           color: appTheme.primaryInverseColor,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(25),
//             topRight: Radius.circular(25),
//           ),
//         ),
//         height: context.height,
//         width: context.width,
//         child: (widget.isCollapsed) ? Text("collapsed") : widget.callToAction,
//       ),
//     );
//   }
// }
