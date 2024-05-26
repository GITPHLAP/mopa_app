import 'package:mopa_app/models/db_models/voyager_db.dart';
import 'package:mopa_app/models/repository/voyager_repository.dart';
import 'package:mopa_app/models/voyager.dart';
import 'package:mopa_app/services/sqflite_service.dart';

class SqfliteVoyagerRepository implements VoyagerRepository {
  @override
  Future<Voyager?> getLastUnfinishedVoyager() async {
    Voyager? voyager;
    VoyagerDB? voyagerdb = await SqfliteService.getLastUnfinishedVoyager();

    if (voyagerdb != null) {
      voyager = voyagerdb.toDTOVoyager();
      // TODO: Fetch Before- and after readings
      
    }
    return voyager;
  }

  @override
  Future upsertVoyager(Voyager voyager) async {
    VoyagerDB? voyagerdb = VoyagerDB.fromDTOVoyager(voyager);
    return await SqfliteService.upsertVoyager(voyagerdb);
  }
}
