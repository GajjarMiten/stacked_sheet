import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/config/globals.dart';
import 'package:stacked_sheet/layers/data/enums/routes_enum.dart';
import 'package:stacked_sheet/layers/domain/enitity/trending_place_enitity.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/widget_extensions/sizedbox_extension.dart';
import 'package:stacked_sheet/layers/presentation/gen/assets.gen.dart';
import 'package:stacked_sheet/layers/presentation/shared/custom_text.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

class TrendingLocationUI extends StatelessWidget {
  TrendingLocationUI({super.key});

  final allLocations = [
    TrendingPlaceEntity(
      name: 'Ophiuchi',
      province: 'KADUNA',
      imageProvider: Assets.images.mars,
    ),
    TrendingPlaceEntity(
      name: 'Santorini',
      province: 'NEW OSOGBO',
      imageProvider: Assets.images.moon,
    ),
    TrendingPlaceEntity(
      name: 'Marrakech',
      province: 'NEPTUNE',
      imageProvider: Assets.images.doom,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final boxHeight = 60.h;
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
              return TrendingPlaceContainer(
                key: ValueKey(data.name),
                trendingPlaceEntity: data,
              );
            },
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
      final double boxWidth = constraints.maxWidth;
      final data = widget.trendingPlaceEntity;
      return GestureDetector(
        onTap: () => navigator.push(Routes.bookingScree, extra: data),
        child: Stack(
          children: [
            Hero(
              tag: data.name,
              child: Container(
                width: boxWidth * 0.9,
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
                width: boxWidth * 0.9,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    appTheme.primaryColor.withOpacity(0.0),
                    appTheme.primaryColor.withOpacity(0.2),
                    appTheme.primaryColor.withOpacity(0.4),
                    appTheme.primaryColor.withOpacity(0.6),
                    appTheme.primaryColor.withOpacity(0.9),
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
        ),
      );
    });
  }
}
