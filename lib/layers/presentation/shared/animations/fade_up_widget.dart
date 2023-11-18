import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';

class FadeUpWidget extends StatelessWidget {
  final Widget child;
  final int delayInMills;
  final int durationInMills;
  const FadeUpWidget(
      {super.key,
      required this.child,
      this.delayInMills = 0,
      int? durationInMills})
      : durationInMills = durationInMills ?? 900;

  @override
  Widget build(BuildContext context) {
    return Animate(
      delay: Duration(milliseconds: delayInMills),
      effects: [
        MoveEffect(
          begin: const Offset(0, 50),
          end: const Offset(0, 0),
          duration: appTheme.animationDuration,
        ),
        FadeEffect(
          begin: 0,
          end: 1,
          duration: appTheme.animationDuration,
        ),
      ],
      child: child,
    );
  }
}
