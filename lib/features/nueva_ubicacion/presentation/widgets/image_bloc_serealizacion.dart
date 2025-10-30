import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_event.dart';

class AdjuntarImagen extends StatefulWidget {
  const AdjuntarImagen({super.key, required this.colorPrincipal});
  final Color colorPrincipal;

  @override
  State<AdjuntarImagen> createState() => _AdjuntarImagenState();
}

class _AdjuntarImagenState extends State<AdjuntarImagen> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.colorPrincipal,
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: () => _mostrarOpcionesDeImagenes(context),
      icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
      label: const Text(
        'Adjuntar Imagen',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _mostrarOpcionesDeImagenes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      backgroundColor: Colors.white,
      builder: (modalContext) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Seleccionar una opción',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Divider(color: Colors.grey[300]),
                ListTile(
                  leading: const Icon(Icons.photo_library_outlined),
                  title: const Text(
                    'Galería',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.pop(modalContext); // cerrar el modal
                    // disparar evento del bloc para galería
                    context.read<ImagenBloc>().add(SeleccionarDesdeGaleria());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text(
                    'Cámara',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.pop(modalContext); // cerrar el modal
                    Navigator.pop(modalContext);
                    // disparar evento del bloc para cámara
                    context.read<ImagenBloc>().add(TomarFotoEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
