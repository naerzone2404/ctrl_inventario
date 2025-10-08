import 'package:equatable/equatable.dart';
import 'package:practicando_clean/features/login/domain/entities/usuario_entity.dart';

abstract class UsuarioState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UsuarioInitial extends UsuarioState {}

class UsuarioLoading extends UsuarioState {}

//Aqui traemos la entidad
class UsuarioAutenticado extends UsuarioState {
  final UsuarioEntitiy usuarioEntitiy;
  UsuarioAutenticado(this.usuarioEntitiy);
  @override
  List<Object?> get props => [usuarioEntitiy];
}

class UsuarioAuthError extends UsuarioState {
  final String message;
  UsuarioAuthError(this.message);

  @override
  List<Object?> get props => [message];
}
