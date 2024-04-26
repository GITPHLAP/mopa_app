import 'package:mopa_app/models/enums.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/ship_models/ship.dart';
import 'package:mopa_app/models/voyager.dart';

class VoyagerManager {
  Voyager? _voyager;
  double _getSumOfReadings(List<Reading> readings, TankTypes type) {
    return readings.where((element) => element.tank.type == type)
    .fold(0, (sum, item) => sum + item.value);
  }
  Voyager get voyager => _voyager!;
  createNewVoyager(int peopleCount, Ship ship) {
    _voyager = Voyager(peopleCount, ship);
  }


  double get sumOfWaterBeforeReadings => _getSumOfReadings(voyager.beforeReadings, TankTypes.water);
  double get sumOfWaterAfterReadings => _getSumOfReadings(voyager.afterReadings, TankTypes.water);
  double get sumOfFuelBeforeReadings => _getSumOfReadings(voyager.beforeReadings, TankTypes.fuel);
  double get sumOfFuelAfterReadings => _getSumOfReadings(voyager.afterReadings, TankTypes.fuel);
  double get sumOfBlackBeforeReadings => _getSumOfReadings(voyager.beforeReadings, TankTypes.black);
  double get sumOfGreyBeforeReadings => _getSumOfReadings(voyager.beforeReadings, TankTypes.grey);
  double get sumOfBlackAfterReadings => _getSumOfReadings(voyager.afterReadings, TankTypes.black);
  double get sumOfGreyAfterReadings => _getSumOfReadings(voyager.afterReadings, TankTypes.grey);

  double daysOfSaillingAccordingWater() {
    // Each person use 100 liters of water each day
    return sumOfWaterBeforeReadings / (voyager.peopleCount * 100); 
  }
  double daysOfSaillingAccordingBlack() {
    double limit = voyager.ship.tanks.where((element) => element.type == TankTypes.black)
      .fold(0, (sum, item) => sum + item.limit);
    // Each person use 50 liters of black each day
    return (limit-sumOfBlackBeforeReadings) / (voyager.peopleCount * 50); 
  }
  double daysOfSaillingAccordingGrey() {
    double limit = voyager.ship.tanks.where((element) => element.type == TankTypes.grey)
      .fold(0, (sum, item) => sum + item.limit);
    // Each person use 50 liters of grey each day
    return (limit-sumOfGreyBeforeReadings) / (voyager.peopleCount * 50); 
  }
  double hoursOfSaillingAccordingFuel() {
    // Machines use 180L/hour
    return sumOfFuelBeforeReadings / 180; 
  }

  double usageOf(TankTypes type) {
    switch (type) {
      case TankTypes.water:
        return sumOfWaterAfterReadings - sumOfWaterBeforeReadings;
      case TankTypes.black:
        return sumOfBlackAfterReadings - sumOfBlackBeforeReadings;
      case TankTypes.grey:
        return sumOfGreyAfterReadings - sumOfGreyBeforeReadings;
      case TankTypes.fuel:
        return sumOfFuelAfterReadings - sumOfFuelBeforeReadings;
      default:
        return 0;
    }
  }
}