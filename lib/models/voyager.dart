import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/ship_models/ship.dart';

class Voyager {
  int peopleCount;
  Ship ship;
  List<Reading> beforeReadings = List.empty();
  List<Reading> afterReadings = List.empty();

  Voyager(this.peopleCount, this.ship);  
}