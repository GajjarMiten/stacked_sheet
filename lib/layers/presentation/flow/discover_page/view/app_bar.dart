import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/widget_extensions/sizedbox_extension.dart';
import 'package:stacked_sheet/layers/presentation/shared/custom_text.dart';

class DiscoverPageAppBar extends StatelessWidget {
  const DiscoverPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appTheme.paddingUnit),
      child: Row(
        children: [
          CustomText.h1(
            'Discover',
          ),
          const Spacer(),
          Icon(
            Icons.more_vert_outlined,
            color: appTheme.primaryInverseColor,
          ),
          15.widthBox,
          const CircleAvatar(radius: 15),
        ],
      ),
    );
  }
}
