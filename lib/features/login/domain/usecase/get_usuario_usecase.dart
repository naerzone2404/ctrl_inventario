import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/login/domain/entities/usuario_entity.dart';
import 'package:practicando_clean/features/login/domain/repository/usuario_repository.dart';

class GetUsuarioUsecase {
  final UsuarioRepository usuarioRepository;

  GetUsuarioUsecase(this.usuarioRepository);

  Future<Either<Failure, UsuarioEntitiy>> call(String uss, String pass) async {
    return await usuarioRepository.obtenerUsuarioRepository(uss, pass);
  }
}
