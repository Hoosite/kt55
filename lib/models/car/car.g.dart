// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarImpl _$$CarImplFromJson(Map<String, dynamic> json) => _$CarImpl(
      json['id'] as int,
      json['car_color'] as String,
      json['car'] as String,
      json['car_model'] as String,
      const DoubleToString().fromJson(json['price'] as String),
    );

Map<String, dynamic> _$$CarImplToJson(_$CarImpl instance) => <String, dynamic>{
      'id': instance.id,
      'car_color': instance.color,
      'car': instance.brand,
      'car_model': instance.model,
      'price': const DoubleToString().toJson(instance.price),
    };
