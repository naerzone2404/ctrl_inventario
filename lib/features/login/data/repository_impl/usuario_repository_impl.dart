import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/login/data/datasource/usuario_remote_datasource.dart';
import 'package:practicando_clean/features/login/domain/entities/usuario_entity.dart';
import 'package:practicando_clean/features/login/domain/repository/usuario_repository.dart';

class UsuarioRepositoryImpl implements UsuarioRepository {
  final UsuarioRemoteDatasource usuarioRemoteDatasource;

  UsuarioRepositoryImpl({required this.usuarioRemoteDatasource});
  @override
  Future<Either<Failure, UsuarioEntitiy>> obtenerUsuarioRepository(
    String uss,
    String pass,
  ) async {
    try {
      final dataUsuarioModel = await usuarioRemoteDatasource
          .iniciarSesionDatasource(uss, pass);
      return Right(dataUsuarioModel.toEntity());
    } catch (e) {
      return Left(ServerFailure('Error al iniciar sesion tipo:$e'));
    }
  }
}
