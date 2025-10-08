import 'package:equatable/equatable.dart';

abstract class UsuarioEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UsuarioIniciadoSesion extends UsuarioEvent {
  final String uss;
  final String pass;

  UsuarioIniciadoSesion({required this.pass, required this.uss});
  @override
  List<Object?> get props => [uss, pass];
}

class UsuarioCerrarSesion extends UsuarioEvent {}
