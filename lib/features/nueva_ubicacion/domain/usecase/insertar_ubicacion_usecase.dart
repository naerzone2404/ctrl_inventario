import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/ubicacion_entity.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/repository/coordenadas_repository.dart';

class InsertarUbicacionUsecase {
  final CoordenadasRepository coordenadasRepository;
  InsertarUbicacionUsecase(this.coordenadasRepository);

  Future<Either<Failure, String>> insertarUbiCall(
    UbicacionEntity ubicacion,
  ) async {
    return await coordenadasRepository.insertarUbicacion(ubicacion);
  }
}
