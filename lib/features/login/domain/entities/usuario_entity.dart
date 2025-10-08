import 'package:equatable/equatable.dart';

class UsuarioEntitiy extends Equatable {
  final bool valid;
  final String message;
  final String? usuario;

  const UsuarioEntitiy({
    required this.valid,
    required this.message,
    required this.usuario,
  });

  @override
  List<Object?> get props => [valid, message, usuario];
}
