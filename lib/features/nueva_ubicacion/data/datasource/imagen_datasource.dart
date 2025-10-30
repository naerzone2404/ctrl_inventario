import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

abstract class ImagenDatasource {
  Future<List<File>> seleccionarDesdeGaleria();
  Future<File>? tomarFoto();
}

class ImagenDataSourceImpl extends ImagenDatasource {
  final ImagePicker picker = ImagePicker();
  @override
  Future<List<File>> seleccionarDesdeGaleria() async {
    final List<XFile>? files = await picker.pickMultiImage();
    if (files == null || files.isEmpty) return [];
    List<File> comprimidas = [];
    for (var f in files) {
      comprimidas.add(await _comprimir(File(f.path)));
    }
    return comprimidas;
  }

  @override
  Future<File>? tomarFoto() {
    // TODO: implement tomarFoto
    throw UnimplementedError();
  }

  Future<File> _comprimir(File file) async {
    final bytes = await file.readAsBytes();
    final decodificar = img.decodeImage(bytes);
    if (decodificar == null) {
      throw Exception('No se pudo decodificar la imagen');
    }
    final resized = img.copyResize(
      decodificar,
      width: (decodificar.width * 0.8).toInt(),
      height: (decodificar.height * 0.8).toInt(),
    );
    final comprimido = img.encodeJpg(resized, quality: 85);
    return file..writeAsBytesSync(comprimido);
  }
}
