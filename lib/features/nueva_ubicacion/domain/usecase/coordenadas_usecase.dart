import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/stand_entity.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/zona_entity.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/repository/coordenadas_repository.dart';

class CoordenadasUsecase {
  final CoordenadasRepository repository;

  CoordenadasUsecase(this.repository);

  Future<Either<Failure, List<ZonaEntity>>> callZona() async {
    return await repository.obtenerZonas();
  }

  Future<Either<Failure, List<StandEntity>>> callStand() async {
    return await repository.obtenerStands();
  }
}
