import 'dart:io';

abstract class ImagenRepository {
  Future<List<File>> seleccionarDesdeGaleria();
  Future<File?> tomarFoto();
}
