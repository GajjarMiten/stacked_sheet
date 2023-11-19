import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/context_extensions/media_query_extension.dart';
import 'package:stacked_sheet/layers/presentation/core/extensions/widget_extensions/sizedbox_extension.dart';
import 'package:stacked_sheet/layers/presentation/flow/discover_page/view/app_bar.dart';
import 'package:stacked_sheet/layers/presentation/flow/discover_page/view/trending_location_ui.dart';
import 'package:stacked_sheet/layers/presentation/shared/animations/fade_up_widget.dart';
import 'package:stacked_sheet/layers/presentation/shared/custom_text.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

import '../../../gen/assets.gen.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DiscoverPageAppBar(),
              TrendingLocationUI(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText.h2(
                          'Feeling Adventurous?',
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    5.heightBox,
                    CustomText.h6(
                      'Get Inspiration from this trending categories',
                    ),
                    15.heightBox,
                    SizedBox(
                      width: context.width,
                      child: GridView.builder(
                        itemBuilder: (context, index) {
                          final images = Assets.images.values;
                          final image = images[index % images.length];
                          final name = image.keyName.split("/").last;
                          return FadeUpWidget(
                            delayInMills: index * 200,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: image.provider(),
                                ),
                              ),
                              child: Center(
                                child: CustomText.h2(
                                  name,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 4,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
