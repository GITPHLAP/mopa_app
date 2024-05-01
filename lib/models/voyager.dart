import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

part 'voyager.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
// @freezed
class Voyager with _$Voyager {
  const factory Voyager({required int peopleCount, required Ship ship, @Default(IList.empty()) IList<Reading> beforeReadings, @Default(IList.empty()) IList<Reading> afterReadings}) = _Voyager;
}