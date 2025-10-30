import 'dart:io';

import 'package:practicando_clean/features/nueva_ubicacion/domain/repository/imagen_repository.dart';

class TomarFotoUsecase {
  final ImagenRepository repository;
  TomarFotoUsecase(this.repository);

  Future<File?> callTomarFoto() async => await repository.tomarFoto();
}
