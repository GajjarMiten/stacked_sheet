import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/domain/enitity/trending_place_enitity.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/widget_extensions/sizedbox_extension.dart';
import 'package:stacked_sheet/layers/presentation/flow/booking_page/view/booking_page.dart';
import 'package:stacked_sheet/layers/presentation/gen/assets.gen.dart';
import 'package:stacked_sheet/layers/presentation/shared/animations/fade_in_widget.dart';
import 'package:stacked_sheet/layers/presentation/shared/custom_text.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

class TrendingLocationUI extends StatelessWidget {
  TrendingLocationUI({super.key});

  final allLocations = [
    TrendingPlaceEntity(
        name: 'Ophiuchi',
        province: 'KADUNA',
        imageProvider: Assets.images.mars,
        info:
            'Santorini is the largest city in New Osogbo structure. It has a substantial atmosphere and is the most Earth-like satellite in the Solar System'),
    TrendingPlaceEntity(
        name: 'Santorini',
        province: 'NEW OSOGBO',
        imageProvider: Assets.images.moon,
        info:
            'Santorini is the largest city in New Osogbo structure. It has a substantial atmosphere and is the most Earth-like satellite in the Solar System'),
    TrendingPlaceEntity(
        name: 'Marrakech',
        province: 'NEPTUNE',
        imageProvider: Assets.images.doom,
        info:
            'Santorini is the largest city in New Osogbo structure. It has a substantial atmosphere and is the most Earth-like satellite in the Solar System'),
  ];

  @override
  Widget build(BuildContext context) {
    final boxHeight = 45.h;
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
          CarouselSlider.builder(
            itemCount: allLocations.length,
            itemBuilder: (context, index, realIndex) {
              final data = allLocations[index];
              return FadeInWidget(
                durationInMills: 1000,
                delayInMills: index * 100,
                child: _TrendingPlaceContainerWrapper(
                  key: ValueKey(data.name),
                  trendingPlaceEntity: data,
                ),
              );
            },
            options: CarouselOptions(
              height: boxHeight - 50,
              viewportFraction: 0.79,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendingPlaceContainerWrapper extends StatelessWidget {
  final TrendingPlaceEntity trendingPlaceEntity;
  const _TrendingPlaceContainerWrapper(
      {super.key, required this.trendingPlaceEntity});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      closedElevation: 0,
      closedColor: Colors.transparent,
      middleColor: Colors.black,
      closedBuilder: (_, action) => InkWell(
        onTap: action,
        child: TrendingPlaceContainer(trendingPlaceEntity: trendingPlaceEntity),
      ),
      openBuilder: (_, action) => BookingPage(placeEntity: trendingPlaceEntity),
    );
  }
}

class TrendingPlaceContainer extends StatefulWidget {
  final TrendingPlaceEntity trendingPlaceEntity;
  const TrendingPlaceContainer({super.key, required this.trendingPlaceEntity});

  @override
  State<TrendingPlaceContainer> createState() => _TrendingPlaceContainerState();
}

class _TrendingPlaceContainerState extends State<TrendingPlaceContainer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final data = widget.trendingPlaceEntity;
      final boxWidth = 70.w;
      return Stack(
        children: [
          Hero(
            tag: data.name,
            child: Container(
              width: boxWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: data.imageProvider.provider(),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: boxWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  appTheme.primaryColor.withOpacity(0.0),
                  appTheme.primaryColor.withOpacity(0.2),
                  appTheme.primaryColor.withOpacity(0.4),
                  appTheme.primaryColor.withOpacity(0.6),
                ],
              )),
              padding: EdgeInsets.all(appTheme.paddingUnit),
              child: SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.castle_rounded,
                              color: appTheme.primaryInverseColor,
                            ),
                            10.widthBox,
                            CustomText.h6(
                              "VR",
                              color: appTheme.primaryInverseColor,
                            )
                          ],
                        ),
                        CustomText(
                          data.name,
                          fontSize: appTheme.sizeH3,
                        ),
                        CustomText.h6(data.province),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(appTheme.paddingUnit / 2),
                      decoration: BoxDecoration(
                        color: appTheme.secondaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.rocket,
                              color: appTheme.primaryInverseColor),
                          CustomText('0.4 BTC'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
