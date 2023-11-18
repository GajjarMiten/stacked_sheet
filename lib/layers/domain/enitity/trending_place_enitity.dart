// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:stacked_sheet/layers/presentation/gen/assets.gen.dart';

class TrendingPlaceEntity {
  final String name;
  final String province;
  final AssetGenImage imageProvider;
  TrendingPlaceEntity({
    required this.name,
    required this.province,
    required this.imageProvider,
  });

  TrendingPlaceEntity copyWith({
    String? name,
    String? province,
    AssetGenImage? imageProvider,
  }) {
    return TrendingPlaceEntity(
      name: name ?? this.name,
      province: province ?? this.province,
      imageProvider: imageProvider ?? this.imageProvider,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'province': province,
      'imageProvider': imageProvider.keyName,
    };
  }

  factory TrendingPlaceEntity.fromMap(Map<String, dynamic> map) {
    return TrendingPlaceEntity(
      name: map['name'] as String,
      province: map['province'] as String,
      imageProvider: AssetGenImage(map['imageProvider']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrendingPlaceEntity.fromJson(String source) =>
      TrendingPlaceEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TrendingPlaceEntity(name: $name, province: $province, imageProvider: $imageProvider)';

  @override
  bool operator ==(covariant TrendingPlaceEntity other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.province == province &&
        other.imageProvider == imageProvider;
  }

  @override
  int get hashCode =>
      name.hashCode ^ province.hashCode ^ imageProvider.hashCode;
}
