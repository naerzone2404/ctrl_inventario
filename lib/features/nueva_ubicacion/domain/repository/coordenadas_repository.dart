import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/stand_entity.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/zona_entity.dart';

abstract class CoordenadasRepository {
  Future<Either<Failure, List<StandEntity>>> obtenerStands();
  Future<Either<Failure, List<ZonaEntity>>> obtenerZonas();
}
