import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/datasource/imagen_datasource.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/repository/imagen_repository.dart';

class ImagenRepositoryImpl implements ImagenRepository {
  final ImagePicker picker = ImagePicker();
  final ImagenDatasource datasource;
  ImagenRepositoryImpl({required this.datasource});
  @override
  Future<List<File>> seleccionarDesdeGaleria() async =>
      await datasource.seleccionarDesdeGaleria();

  @override
  Future<File?> tomarFoto() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        return File(photo.path);
      }
    } else {
      throw Exception('Permiso de camara denegado');
    }
    return await null;
  }
}
