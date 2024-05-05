import 'package:mopa_app/models/repository/sqflite_voyager_repository.dart';
import 'package:mopa_app/models/repository/voyager_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voyager_repository_provider.g.dart';

@riverpod
VoyagerRepository voyagerRepository(ref) {
  return SqfliteVoyagerRepository();
}
