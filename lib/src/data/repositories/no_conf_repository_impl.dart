import 'package:gestion_tesis/src/data/models/no_conformidad.dart';
import 'package:gestion_tesis/src/data/remote_data_source/no_conf_remote_data_source.dart';
import 'package:gestion_tesis/src/domain/repositories/no_conf_repository.dart';

class NoConformidadRepositoryImpl extends NoConformidadRepository {
  NoConformidadRepositoryImpl(this.dataSource);

  final NoConformidadRemoteDataSource dataSource;

  @override
  Future<List<NoConformidad>> getAllNoConformidad() async {
    return await dataSource.getAllNoConformidad();
  }

  @override
  Future<NoConformidad> getNoConformidadById(int id) async {
    return await dataSource.getNoConformidadById(id);
  }
}
