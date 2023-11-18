// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:stacked_sheet/layers/presentation/gen/assets.gen.dart';

class TrendingPlaceEntity {
  final String name;
  final String province;
  final String info;
  final AssetGenImage imageProvider;
  TrendingPlaceEntity({
    required this.name,
    required this.province,
    required this.info,
    required this.imageProvider,
  });

  TrendingPlaceEntity copyWith({
    String? name,
    String? province,
    String? info,
    AssetGenImage? imageProvider,
  }) {
    return TrendingPlaceEntity(
      name: name ?? this.name,
      province: province ?? this.province,
      info: info ?? this.info,
      imageProvider: imageProvider ?? this.imageProvider,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'province': province,
      'info': info,
      'imageProvider': imageProvider.keyName,
    };
  }

  factory TrendingPlaceEntity.fromMap(Map<String, dynamic> map) {
    return TrendingPlaceEntity(
      name: map['name'] as String,
      province: map['province'] as String,
      info: map['info'] as String,
      imageProvider: AssetGenImage(map['imageProvider']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrendingPlaceEntity.fromJson(String source) =>
      TrendingPlaceEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TrendingPlaceEntity(name: $name, province: $province, info: $info, imageProvider: $imageProvider)';
  }

  @override
  bool operator ==(covariant TrendingPlaceEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.province == province &&
      other.info == info &&
      other.imageProvider == imageProvider;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      province.hashCode ^
      info.hashCode ^
      imageProvider.hashCode;
  }
}
