import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/login/domain/entities/usuario_entity.dart';

abstract class UsuarioRepository {
  Future<Either<Failure, UsuarioEntitiy>> obtenerUsuarioRepository(
    String uss,
    String pass,
  );
}
