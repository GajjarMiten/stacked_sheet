import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/context_extensions/media_query_extension.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/widget_extensions/sizedbox_extension.dart';
import 'package:stacked_sheet/layers/presentation/shared/animations/fade_up_widget.dart';
import 'package:stacked_sheet/layers/presentation/shared/custom_text.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

class CalenderSheetBody extends StatelessWidget {
  const CalenderSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeUpWidget(
          child: Container(
            padding: EdgeInsets.all(2 * appTheme.paddingUnit),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                  color: appTheme.primaryInverseColor.withOpacity(0.2),
                  width: 1),
            )),
            child: Column(
              children: [
                _buildLocationIndicator(city: 'Lagos'),
                20.heightBox,
                _buildLocationIndicator(isFrom: false, city: 'Santorini'),
              ],
            ),
          ),
        ),
        20.heightBox,
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeUpWidget(
                delayInMills: 200,
                child: CustomText.h2(
                  "Trip Calender",
                  fontSize: 15.sp,
                ),
              ),
              _buildCalender(),
            ],
          ),
        )
      ],
    );
  }

  FadeUpWidget _buildCalender() {
    final commonTextStyle =
        TextStyle(color: appTheme.secondaryColor, fontWeight: FontWeight.bold);
    return FadeUpWidget(
      delayInMills: 400,
      child: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: appTheme.secondaryColor),
          datePickerTheme: DatePickerThemeData(
            yearStyle: commonTextStyle,
            dayForegroundColor:
                MaterialStatePropertyAll(appTheme.primaryInverseColor),
            dayStyle: commonTextStyle,
            yearBackgroundColor:
                MaterialStatePropertyAll(appTheme.secondaryColor),
            weekdayStyle: commonTextStyle,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: appTheme.paddingUnit),
          child: SizedBox(
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2200),
              onDateChanged: (d) {},
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationIndicator({String city = '', bool isFrom = true}) {
    Widget icon = Icon(
      Icons.location_on,
      color: appTheme.secondaryColor,
      size: 27,
    );

    if (isFrom) {
      icon = Column(
        children: [
          Icon(
            Icons.circle_outlined,
            color: appTheme.secondaryColor,
          ),
          if (isFrom)
            Container(
              height: 30,
              width: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    appTheme.secondaryColor,
                    appTheme.primaryColor,
                  ],
                ),
              ),
            )
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        10.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.rich(
              TextSpan(children: [
                TextSpan(text: "$city, "),
                TextSpan(
                  text: "LOS",
                  style: TextStyle(
                      color: appTheme.secondaryColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold),
                ),
              ]),
              textStyle: TextStyle(
                color: appTheme.primaryInverseColor,
                fontSize: 10.sp,
              ),
            ),
            CustomText.rich(
              TextSpan(children: [
                TextSpan(text: isFrom ? "FROM " : "TO "),
                const TextSpan(
                  text: " NIGERIA",
                ),
              ]),
              textStyle: TextStyle(
                color: appTheme.primaryInverseColor.withOpacity(0.5),
                fontSize: 7.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CalenderCallToAction extends StatelessWidget {
  const CalenderCallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 100,
      decoration: BoxDecoration(
        color: appTheme.secondaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(child: CustomText("SEAT",fontSize: 17.sp,)),
    );
  }
}
