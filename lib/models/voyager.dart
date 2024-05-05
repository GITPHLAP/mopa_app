import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/ship_models/ship.dart';

part 'voyager.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
// @freezed
class Voyager with _$Voyager {
  // Need empty constructer to use defined methods.
  const Voyager._();
  const factory Voyager(
      {int? id,
      required int peopleCount,
      required Ship ship,
      @Default(IList.empty()) IList<Reading> beforeReadings,
      @Default(IList.empty()) IList<Reading> afterReadings}) = _Voyager;

  /// isEnded Check if before readings and after readings count is equal to ship tanks count
  /// And the value is above 1 and less or equal to limit
  bool isEnded() {
    // Counts check
    int tankCount = ship.tanks.length;

    bool isCountsValid =
        beforeReadings.length == tankCount && afterReadings.length == tankCount;

    bool isBeforeReadingsValid = beforeReadings
        .any((element) => element.value.isInRange(1, element.tank.limit + 1));
    bool isAfterReadingsValid = afterReadings
        .any((element) => element.value.isInRange(1, element.tank.limit + 1));

    return isCountsValid && isBeforeReadingsValid && isAfterReadingsValid;
  }
}
