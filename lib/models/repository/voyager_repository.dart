import 'package:mopa_app/models/voyager.dart';

abstract class VoyagerRepository {
  Future<Voyager> getLastUnfinishedVoyager();
  Future upsertVoyager(Voyager voyager);
  Future finishVoyager(Voyager voyager);
  Future clearEverything();
}
