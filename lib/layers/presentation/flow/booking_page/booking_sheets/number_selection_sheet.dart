import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/context_extensions/media_query_extension.dart';
import 'package:stacked_sheet/layers/presentation/shared/animations/fade_up_widget.dart';
import 'package:stacked_sheet/layers/presentation/shared/custom_text.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

class NumberSelectionSheetBody extends StatefulWidget {
  const NumberSelectionSheetBody({super.key});

  @override
  State<NumberSelectionSheetBody> createState() =>
      _NumberSelectionSheetBodyState();
}

class _NumberSelectionSheetBodyState extends State<NumberSelectionSheetBody> {
  int adultNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.secondaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(appTheme.paddingUnit),
            child: Column(
              children: [
                CustomText.h2('How many adults?'),
                CustomText(
                  '12 YEARS +',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.width,
            height: 300,
            child: CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (context, index, realIndex) {
                final isCurrentSelection = index + 1 == adultNumber;
                return CustomText.h1(
                  (index + 1).toString(),
                  fontSize: 110.sp,
                  color: isCurrentSelection
                      ? appTheme.primaryInverseColor
                      : appTheme.primaryInverseColor.withOpacity(0.5),
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    adultNumber = index + 1;
                  });
                },
                enableInfiniteScroll: false,
                height: 200,
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                enlargeFactor: 0.5,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
            ),
          ),
          CustomText.rich(
            TextSpan(children: [
              const TextSpan(text: 'Total: '),
              TextSpan(
                text: '${(adultNumber * 0.4).toStringAsFixed(1)} BTC',
                style: TextStyle(
                  color: appTheme.primaryInverseColor,
                ),
              )
            ]),
            textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class NumberSelectionSheetCollapsedWidget extends StatelessWidget {
  const NumberSelectionSheetCollapsedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      padding: const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        color: appTheme.secondaryColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: FadeUpWidget(child: CustomText.h2('3 ADULTS')),
    );
  }
}

class NumberSelectionCallToAction extends StatelessWidget {
  const NumberSelectionCallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 100,
      decoration: BoxDecoration(
        color: appTheme.greyColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Center(
              child: CustomText(
            "PAY",
            fontSize: 17.sp,
          )),
          Positioned(
            right: 20,
            top: 10,
            child: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.chevron_right_rounded,
                color: appTheme.primaryInverseColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
