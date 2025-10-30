import 'dart:io';

import 'package:practicando_clean/features/nueva_ubicacion/domain/repository/imagen_repository.dart';

class SeleccionarImagenesUsecase {
  final ImagenRepository repository;

  SeleccionarImagenesUsecase(this.repository);

  Future<List<File>> callSeleccionaImagen() async =>
      await repository.seleccionarDesdeGaleria();
}
