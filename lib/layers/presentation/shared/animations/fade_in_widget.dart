import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';

class FadeInWidget extends StatelessWidget {
  final Widget child;
  final int delayInMills;
  final int durationInMills;
  const FadeInWidget(
      {super.key,
      required this.child,
      this.delayInMills = 0,
      int? durationInMills})
      : durationInMills = durationInMills ?? 700;

  @override
  Widget build(BuildContext context) {
    return Animate(
      delay: Duration(milliseconds: delayInMills),
      effects: [
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
