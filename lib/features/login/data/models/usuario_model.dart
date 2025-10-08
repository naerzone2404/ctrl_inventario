import 'package:practicando_clean/features/login/domain/entities/usuario_entity.dart';

class UsuarioModel {
  final bool valid;
  final String message;
  final String? usuario;

  UsuarioModel({
    required this.valid,
    required this.message,
    required this.usuario,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      valid: json['valid'] as bool,
      message: json['message'] as String,
      usuario: json['usuario'] as String?,
    );
  }

  UsuarioEntitiy toEntity() {
    return UsuarioEntitiy(valid: valid, message: message, usuario: usuario);
  }
}
