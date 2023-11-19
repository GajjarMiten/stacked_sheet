import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/flow/discover_page/view/app_bar.dart';
import 'package:stacked_sheet/layers/presentation/flow/discover_page/view/trending_location_ui.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const DiscoverPageAppBar(),
            TrendingLocationUI(),
          ],
        ),
      ),
    );
  }
}
