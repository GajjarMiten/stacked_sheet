import 'package:flutter/material.dart';

/// A controller class for managing the state of a StackedSheetView.
///
/// The StackedSheetController extends [ValueNotifier] and keeps track of the currently opened sheet index,
/// as well as a list of indices for sheets that are currently open. It provides methods to open, close,
/// and manage the state of the stacked sheets.
class StackedSheetController extends ValueNotifier<int> {
  /// The total number of sheets managed by the controller.
  final int _length;

  /// A list of indices representing currently open sheets.
  final List<int> openedSheetIndices = [];

  /// Constructs a [StackedSheetController] with the specified number of sheets.
  ///
  /// - [length]: The total number of sheets managed by the controller.
  StackedSheetController({required int length})
      : _length = length,
        super(-1);

  /// Returns `true` if there are open sheets, otherwise returns `false`.
  bool get hasOpenSheets => !value.isNegative;

  /// Returns the total number of sheets managed by the controller.
  int get totalSheets => _length;

  /// Opens the next sheet in the sequence, if available.
  ///
  /// If the current sheet is the last sheet, this method does nothing.
  void openNext() {
    if (value >= _length - 1) return;
    value++;
    openedSheetIndices.add(value);
    notifyListeners();
  }

  /// Closes the currently open sheet.
  ///
  /// If no sheet is open, this method does nothing.
  void closeCurrent() {
    if (value == -1) return;
    value--;
    notifyListeners();
  }

  /// Closes all open sheets, resetting the controller to its initial state.
  void closeAll() {
    value = -1;
    openedSheetIndices.clear();
    notifyListeners();
  }

  /// Checks if a sheet at the specified index is currently open.
  ///
  /// - [index]: The index of the sheet to check.
  /// Returns `true` if the sheet is open, otherwise returns `false`.
  bool isSheetOpened(int index) {
    return openedSheetIndices.contains(index);
  }
}
