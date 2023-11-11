import 'package:freezed_annotation/freezed_annotation.dart';

part 'car.freezed.dart';
part 'car.g.dart';

class DoubleToString implements JsonConverter<double, String> {
  const DoubleToString();

  @override
  double fromJson(String str) {
    return double.parse(str.replaceAll('\$', ''));
  }
  @override
    String toJson(double object) {
      throw UnimplementedError();
    }
  }

@freezed
class Car with _$Car {

  factory Car(
    int id,
    @JsonKey(name: "car_color") String color,
    @JsonKey(name: "car") String brand,
    @JsonKey(name: "car_model") String model,
    @DoubleToString() double price,
  ) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}