import 'package:flutter/material.dart';

class StackedSheetController extends ValueNotifier<int> {
  final int _length;
  final List<int> openedSheetIndexs = [];
  StackedSheetController({required int length})
      : _length = length,
        super(-1);

  bool get hasOpenSheets => !value.isNegative;
  int get totalSheets => _length;

  void openNext() {
    if (value >= _length - 1) return;
    value++;
    openedSheetIndexs.add(value);
    notifyListeners();
  }

  void closeCurrent() {
    if (value == -1) return;
    value--;
    notifyListeners();
  }

  void closeAll() {
    value = -1;
    openedSheetIndexs.clear();
    notifyListeners();
  }

  bool isSheetOpened(int index) {
    return openedSheetIndexs.contains(index);
  }
}
