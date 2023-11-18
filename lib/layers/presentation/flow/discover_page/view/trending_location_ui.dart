import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/context_extensions/media_query_extension.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/widget_extensions/sizedbox_extension.dart';
import 'package:stacked_sheet/layers/presentation/shared/custom_text.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

class TrendingLocationUI extends StatelessWidget {
  const TrendingLocationUI({super.key});

  @override
  Widget build(BuildContext context) {
    final boxHeight = 60.h;
    final boxWidth = context.width;
    return SizedBox(
      height: boxHeight,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: appTheme.paddingUnit),
            child: CustomText.h6('Trending locations today'),
          ),
          10.heightBox,
          CarouselSlider(
            items: [
              Container(
                width: boxWidth * 0.7,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              Container(
                width: boxWidth * 0.7,
                color: Colors.red,
              ),
              Container(
                width: boxWidth * 0.7,
                color: Colors.red,
              ),
              Container(
                width: boxWidth * 0.7,
                color: Colors.red,
              ),
            ],
            options: CarouselOptions(
              height: boxHeight * 0.7,
              viewportFraction: 0.75,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            ),
          ),
        ],
      ),
    );
  }
}
