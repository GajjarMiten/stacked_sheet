import 'package:flutter/material.dart';

/// A class that defines customizable options for the StackedSheetView.
class StackedSheetOptions {
  /// The duration of the animation when opening or closing the stacked sheet.
  final Duration? animationDuration;

  /// The curve of the animation when opening or closing the stacked sheet.
  final Curve? animationCurve;

  /// The shape of the stacked sheet.
  final ShapeBorder? shape;

  /// The background color of the stacked sheet.
  final Color? sheetColor;

  /// The duration of the animation when opening the stacked sheet.
  final Duration? sheetOpenDuration;

  /// The curve of the animation when opening the stacked sheet.
  final Curve? sheetOpenCurve;

  /// The duration of the animation when closing the stacked sheet.
  final Duration? sheetCloseDuration;

  /// The curve of the animation when closing the stacked sheet.
  final Curve? sheetCloseCurve;

  /// Constructs a [StackedSheetOptions] object with customizable parameters.
  ///
  /// - [animationDuration]: The duration of the animation when opening or closing the stacked sheet.
  /// - [animationCurve]: The curve of the animation when opening or closing the stacked sheet.
  /// - [shape]: The shape of the stacked sheet.
  /// - [sheetColor]: The background color of the stacked sheet.
  /// - [sheetOpenDuration]: The duration of the animation when opening the stacked sheet.
  /// - [sheetOpenCurve]: The curve of the animation when opening the stacked sheet.
  /// - [sheetCloseDuration]: The duration of the animation when closing the stacked sheet.
  /// - [sheetCloseCurve]: The curve of the animation when closing the stacked sheet.
  ///
  /// Example:
  /// ```dart
  /// StackedSheetOptions(
  ///   animationDuration: Duration(milliseconds: 500),
  ///   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ///   sheetColor: Colors.blue,
  ///   sheetOpenDuration: Duration(milliseconds: 800),
  ///   sheetOpenCurve: Curves.easeInOut,
  ///   // ... other parameters
  /// );
  /// ```
  const StackedSheetOptions({
    this.animationDuration,
    this.animationCurve,
    this.shape,
    this.sheetColor,
    this.sheetOpenDuration,
    this.sheetOpenCurve,
    this.sheetCloseDuration,
    this.sheetCloseCurve,
  });

  /// Constructs a default [StackedSheetOptions] object with predefined values.
  const StackedSheetOptions.defaultOptions()
      : animationCurve = Curves.linear,
        animationDuration = const Duration(milliseconds: 700),
        shape = const RoundedRectangleBorder(),
        sheetColor = Colors.white,
        sheetOpenDuration = const Duration(milliseconds: 700),
        sheetOpenCurve = Curves.linear,
        sheetCloseDuration = const Duration(milliseconds: 700),
        sheetCloseCurve = Curves.linear;

  /// Creates a new [StackedSheetOptions] instance with updated parameter values.
  StackedSheetOptions copyWith({
    Duration? animationDuration,
    Curve? animationCurve,
    ShapeBorder? shape,
    Color? sheetColor,
    Duration? sheetOpenDuration,
    Curve? sheetOpenCurve,
    Duration? sheetCloseDuration,
    Curve? sheetCloseCurve,
  }) {
    return StackedSheetOptions(
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      shape: shape ?? this.shape,
      sheetColor: sheetColor ?? this.sheetColor,
      sheetOpenDuration: sheetOpenDuration ?? this.sheetOpenDuration,
      sheetOpenCurve: sheetOpenCurve ?? this.sheetOpenCurve,
      sheetCloseDuration: sheetCloseDuration ?? this.sheetCloseDuration,
      sheetCloseCurve: sheetCloseCurve ?? this.sheetCloseCurve,
    );
  }

  @override
  String toString() {
    return 'StackedSheetOptions(animationDuration: $animationDuration, animationCurve: $animationCurve, shape: $shape, sheetColor: $sheetColor, sheetOpenDuration: $sheetOpenDuration, sheetOpenCurve: $sheetOpenCurve, sheetCloseDuration: $sheetCloseDuration, sheetCloseCurve: $sheetCloseCurve)';
  }

  @override
  bool operator ==(covariant StackedSheetOptions other) {
    if (identical(this, other)) return true;

    return other.animationDuration == animationDuration &&
        other.animationCurve == animationCurve &&
        other.shape == shape &&
        other.sheetColor == sheetColor &&
        other.sheetOpenDuration == sheetOpenDuration &&
        other.sheetOpenCurve == sheetOpenCurve &&
        other.sheetCloseDuration == sheetCloseDuration &&
        other.sheetCloseCurve == sheetCloseCurve;
  }

  @override
  int get hashCode {
    return animationDuration.hashCode ^
        animationCurve.hashCode ^
        shape.hashCode ^
        sheetColor.hashCode ^
        sheetOpenDuration.hashCode ^
        sheetOpenCurve.hashCode ^
        sheetCloseDuration.hashCode ^
        sheetCloseCurve.hashCode;
  }
}
