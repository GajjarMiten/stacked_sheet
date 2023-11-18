import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked_sheet/layers/config/globals.dart';
import 'package:stacked_sheet/layers/domain/enitity/trending_place_enitity.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/context_extensions/media_query_extension.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/widget_extensions/sizedbox_extension.dart';
import 'package:stacked_sheet/layers/presentation/gen/assets.gen.dart';
import 'package:stacked_sheet/layers/presentation/shared/animations/fade_in_widget.dart';
import 'package:stacked_sheet/layers/presentation/shared/custom_text.dart';
import 'package:stacked_sheet/layers/presentation/shared/animations/fade_up_widget.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_controller.dart';
import 'package:stacked_sheet/layers/presentation/shared/stacked_sheet_view/stacked_sheet_view.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

class BookingPage extends StatefulWidget {
  final TrendingPlaceEntity placeEntity = TrendingPlaceEntity(
      name: 'Ophiuchi',
      province: 'KADUNA',
      imageProvider: Assets.images.mars,
      info:
          'Santorini is the largest city in New Osogbo structure. It has a substantial atmosphere and is the most Earth-like satellite in the Solar System');
  BookingPage({
    super.key,
  });

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  late TrendingPlaceEntity data;
  final StackedSheetController _stackedSheetController =
      StackedSheetController(length: 3);

  @override
  void initState() {
    data = widget.placeEntity;
    super.initState();
  }

  @override
  void dispose() {
    _stackedSheetController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BookingPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = widget.placeEntity;
  }

  @override
  Widget build(BuildContext context) {
    return StackedSheetView(
      controller: _stackedSheetController,
      items: [
        StackedSheetItem(
          body: Text("body"),
          collapsedWidget: CustomText("collapsed"),
          callToAction: GestureDetector(
            onTap: _stackedSheetController.openNext,
            child: Text("data"),
          ),
        ),
        StackedSheetItem(
          body: Text("body1"),
          collapsedWidget: Text("collapsed2"),
          callToAction: GestureDetector(
            onTap: _stackedSheetController.openNext,
            child: Text("data1"),
          ),
        ),
        StackedSheetItem(
          body: Text("body2"),
          collapsedWidget: Text("collapsed3"),
          callToAction: GestureDetector(
            onTap: _stackedSheetController.openNext,
            child: Text("data2"),
          ),
        ),
      ],
      closedChild: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            ..._buildBackground(),
            _buildHeader(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 70.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeUpWidget(child: CustomText.h1(data.name)),
                    20.heightBox,
                    FadeUpWidget(
                      delayInMills: 100,
                      child: Container(
                        padding: EdgeInsets.all(appTheme.paddingUnit / 2),
                        decoration: BoxDecoration(
                            color:
                                appTheme.primaryInverseColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.cloud),
                            15.widthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'WEATHER NOW',
                                  fontSize: 8.sp,
                                  color: appTheme.primaryInverseColor
                                      .withOpacity(0.6),
                                ),
                                CustomText(
                                  '32°C - Light Rain',
                                  fontSize: 9.sp,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    20.heightBox,
                    FadeUpWidget(
                      delayInMills: 200,
                      child: CustomText(data.info, fontSize: 12.sp),
                    ),
                    60.heightBox,
                    FadeUpWidget(
                      delayInMills: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildExtraOptions(
                              icon: Icons.castle_rounded, title: "VR TOURE"),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              color: appTheme.primaryInverseColor,
                              thickness: 2,
                            ),
                          ),
                          _buildExtraOptions(
                              icon: Icons.camera_alt, title: "GALLERY"),
                        ],
                      ),
                    ),
                    40.heightBox,
                    FadeUpWidget(
                      delayInMills: 400,
                      child: InkWell(
                        onTap: () {
                          _stackedSheetController.openNext();
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: appTheme.secondaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.rocket,
                                color: appTheme.primaryInverseColor,
                              ),
                              10.widthBox,
                              CustomText(
                                "SCHEDULE TRIP",
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    40.heightBox,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FadeInWidget(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(appTheme.paddingUnit),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  if (_stackedSheetController.hasOpenSheets) {
                    _stackedSheetController.closeAll();
                  } else {
                    navigator.pop();
                  }
                },
                color: appTheme.primaryInverseColor,
              ),
              CustomText.h6(data.province, color: appTheme.primaryInverseColor),
              Icon(
                Icons.more_vert_outlined,
                color: appTheme.primaryInverseColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBackground() {
    return [
      Animate(
        effects: [
          ScaleEffect(
              begin: const Offset(1, 1),
              end: const Offset(1.5, 1.5),
              duration: appTheme.animationDuration),
        ],
        child: Container(
          width: double.infinity,
          height: context.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  appTheme.primaryColor.withOpacity(0.4), BlendMode.darken),
              fit: BoxFit.cover,
              image: widget.placeEntity.imageProvider.provider(),
            ),
          ),
        ),
      ),
      Animate(
        effects: [
          ColorEffect(
            begin: Colors.transparent,
            end: appTheme.primaryColor.withOpacity(0.3),
            blendMode: BlendMode.color,
            curve: Curves.decelerate,
            duration: 1.seconds,
          ),
        ],
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: const Text(""),
        ),
      ),
    ];
  }

  Widget _buildExtraOptions({required IconData icon, required String title}) {
    return Row(children: [
      Icon(
        icon,
        color: appTheme.secondaryColor,
      ),
      10.widthBox,
      CustomText(
        title,
        fontWeight: FontWeight.bold,
      )
    ]);
  }
}
