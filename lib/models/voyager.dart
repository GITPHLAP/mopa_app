import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/ship_models/ship.dart';

class Voyager {
  int peopleCount;
  Ship ship;
  List<Reading> beforeReadings = [];
  List<Reading> afterReadings = [];

  Voyager(this.peopleCount, this.ship);  
}