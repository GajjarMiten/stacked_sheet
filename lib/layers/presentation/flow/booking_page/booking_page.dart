import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/domain/enitity/trending_place_enitity.dart';

class BookingPage extends StatelessWidget {
  final TrendingPlaceEntity placeEntity;
  const BookingPage({super.key, required this.placeEntity});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: placeEntity.name,
      child: Container(
        width: double.infinity,
        height: 600,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: placeEntity.imageProvider.provider(),
          ),
        ),
      ),
    );
  }
}
