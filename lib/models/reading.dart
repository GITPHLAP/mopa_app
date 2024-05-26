import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mopa_app/models/tank_models/tank.dart';

part 'reading.freezed.dart';

@freezed
class Reading with _$Reading {
  const factory Reading({int? id, required Tank tank, required double value}) = _Reading;

}