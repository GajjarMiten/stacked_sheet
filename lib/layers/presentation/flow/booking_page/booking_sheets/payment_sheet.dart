import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/shared/custom_text.dart';

class PaymentSheetBody extends StatelessWidget {
  const PaymentSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Center(
        child: InkWell(
          child: Container(
            padding: EdgeInsets.all(appTheme.paddingUnit),
            decoration: BoxDecoration(
                color: appTheme.iosBlueColor,
                borderRadius: BorderRadius.circular(12)),
            child: CustomText("Proceed for Payment"),
          ),
        ),
      ),
    );
  }
}
