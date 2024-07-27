import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mopa_app/models/db_models/reading_db.dart';
import 'package:mopa_app/models/db_models/voyager_db.dart';
import 'package:mopa_app/models/reading.dart';
import 'package:mopa_app/models/repository/voyager_repository.dart';
import 'package:mopa_app/models/ship_models/ship_900.dart';
import 'package:mopa_app/models/voyager.dart';
import 'package:mopa_app/services/sqflite_service.dart';

class SqfliteVoyagerRepository implements VoyagerRepository {
  @override
  Future<Voyager> getLastUnfinishedVoyager() async {
    Voyager voyager;
    VoyagerDB? voyagerdb = await SqfliteService.getLastUnfinishedVoyager();

    if (voyagerdb != null) {
      voyager = voyagerdb.toDTOVoyager();
      var afterDBReadings = await SqfliteService.getReadingsForVoyager(voyager.id!, true);
      var beforeDBReadings = await SqfliteService.getReadingsForVoyager(voyager.id!, false);

      List<Reading> afterReadings = [];
      List<Reading> beforeReadings = [];
      for (var r in afterDBReadings) {
        afterReadings.add(r.toDTOReading(voyager.ship));
      }
      for (var r in beforeDBReadings) {
        beforeReadings.add(r.toDTOReading(voyager.ship));
      }
      voyager = voyager.copyWith(
          afterReadings: afterReadings.toIList(),
          beforeReadings: beforeReadings.toIList());
    } else {
      voyager = Voyager(peopleCount: 12, ship: Ship900());
    }
    return voyager;
  }

  @override
  Future upsertVoyager(Voyager voyager) async {
    VoyagerDB? voyagerdb = VoyagerDB.fromDTOVoyager(voyager);
    int voyagerId = await SqfliteService.upsertVoyager(voyagerdb);

    // Upsert readings
    List<ReadingDB> afterReadingDB = voyager.afterReadings.map<ReadingDB>((r) => ReadingDB.fromDTOVoyager(r)).toList();
    List<ReadingDB> beforeReadingDB = voyager.beforeReadings.map<ReadingDB>((r) => ReadingDB.fromDTOVoyager(r)).toList();
    await SqfliteService.batchUpsertReadings(afterReadingDB, true, voyagerId);
    await SqfliteService.batchUpsertReadings(beforeReadingDB, false, voyagerId);
    return; 
  }
  
  @override
  Future saveVoyager(Voyager voyager) async {
    VoyagerDB? voyagerdb = VoyagerDB.fromDTOVoyager(voyager);
    voyagerdb.isEnded = 1;
    int voyagerId = await SqfliteService.upsertVoyager(voyagerdb);

    // Upsert readings
    List<ReadingDB> afterReadingDB = voyager.afterReadings.map<ReadingDB>((r) => ReadingDB.fromDTOVoyager(r)).toList();
    List<ReadingDB> beforeReadingDB = voyager.beforeReadings.map<ReadingDB>((r) => ReadingDB.fromDTOVoyager(r)).toList();
    await SqfliteService.batchUpsertReadings(afterReadingDB, true, voyagerId);
    await SqfliteService.batchUpsertReadings(beforeReadingDB, false, voyagerId);
    return; 
  }
  
  @override
  Future clearEverything() async {
    return await SqfliteService.clearTables();
  }
}
