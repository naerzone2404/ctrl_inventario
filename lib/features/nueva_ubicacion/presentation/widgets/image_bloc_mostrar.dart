import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_event.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_state.dart';

class ImageBlocMostrar extends StatelessWidget {
  const ImageBlocMostrar({super.key, required this.colorPrincipal});
  final Color colorPrincipal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagenBloc, ImagenState>(
      builder: (context, state) {
        if (state is ImageLoading) {
          return Center(
            child: LoadingAnimationWidget.threeRotatingDots(
              color: colorPrincipal,
              size: 40,
            ),
          );
        } else if (state is ImagenCargadoObtenida) {
          return _mostrarImagenes(context, state.imagenes);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _mostrarImagenes(BuildContext context, List<File> imagenes) {
    if (imagenes.isEmpty) {
      return const Center(
        child: Text(
          'No hay imágenes seleccionadas',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imagenes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final file = imagenes[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(file, fit: BoxFit.cover),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: InkWell(
                onTap: () =>
                    context.read<ImagenBloc>().add(EliminarImagenEvent(index)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
