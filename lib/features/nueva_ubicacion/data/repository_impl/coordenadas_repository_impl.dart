import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/datasource/coordenadas_remote_datasource.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/stand_entity.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/ubicacion_entity.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/zona_entity.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/repository/coordenadas_repository.dart';

class CoordenadasRepositoryImpl implements CoordenadasRepository {
  final CoordenadasRemoteDatasource remoteDatasource;

  CoordenadasRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, List<StandEntity>>> obtenerStands() async {
    try {
      final stands = await remoteDatasource.getStand();
      final data = stands.map((S) => S.toStandEntity()).toList();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure('Error al obtener Stock del sistema Impl'));
    }
  }

  @override
  Future<Either<Failure, List<ZonaEntity>>> obtenerZonas() async {
    try {
      final zonas = await remoteDatasource.getZonas();
      final data = zonas.map((Z) => Z.toZonaEntity()).toList();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure('Error tipo: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> insertarUbicacion(
    UbicacionEntity ubicacion,
  ) async {
    try {
      final result = await remoteDatasource.insertarUbicacion(ubicacion);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
