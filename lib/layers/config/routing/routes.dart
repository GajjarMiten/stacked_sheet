import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked_sheet/layers/data/enums/routes_enum.dart';
import 'package:stacked_sheet/layers/domain/enitity/trending_place_enitity.dart';
import 'package:stacked_sheet/layers/presentation/flow/booking_page/booking_page.dart';
import 'package:stacked_sheet/layers/presentation/flow/discover_page/view/discover_page.dart';

Widget getPage(Routes route, BuildContext context, GoRouterState state) {
  return switch (route) {
    Routes.discoverScreen => const DiscoverPage(),
    Routes.bookingScree =>
      BookingPage(placeEntity: state.extra as TrendingPlaceEntity),
    _ => const Text("404"),
  };
}
