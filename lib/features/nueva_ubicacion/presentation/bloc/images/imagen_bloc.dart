import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/usecase/seleccionar_imagenes_usecase.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/usecase/tomar_foto_usecase.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_event.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_state.dart';

class ImagenBloc extends Bloc<ImagenEvent, ImagenState> {
  final SeleccionarImagenesUsecase seleccionarUsecase;
  final TomarFotoUsecase tomarFotoUsecase;
  List<File> _imagenes = [];

  ImagenBloc({required this.seleccionarUsecase, required this.tomarFotoUsecase})
    : super(ImagenInitial()) {
    on<SeleccionarDesdeGaleria>(_onSeleccionarGaleria);
    on<TomarFotoEvent>(_onTomarFoto);
    on<EliminarImagenEvent>(_onEliminarImagen);
    on<LimpiarImagenEvent>(_onLimpiar);
  }

  Future<void> _onSeleccionarGaleria(
    SeleccionarDesdeGaleria event,
    Emitter<ImagenState> emit,
  ) async {
    emit(ImageLoading());
    try {
      final imgs = await seleccionarUsecase.callSeleccionaImagen();
      _imagenes.addAll(imgs);
      emit(ImagenCargadoObtenida(List.from(_imagenes)));
    } catch (e) {
      emit(ImagenError(e.toString()));
    }
  }

  Future<void> _onTomarFoto(
    TomarFotoEvent event,
    Emitter<ImagenState> emit,
  ) async {
    emit(ImageLoading());
    try {
      final foto = await tomarFotoUsecase.callTomarFoto();
      if (foto != null) _imagenes.add(foto);
      emit(ImagenCargadoObtenida(List.from(_imagenes)));
    } catch (e) {
      emit(ImagenError(e.toString()));
    }
  }

  void _onEliminarImagen(EliminarImagenEvent event, Emitter<ImagenState> emit) {
    _imagenes.removeAt(event.index);
    emit(ImagenCargadoObtenida(List.from(_imagenes)));
  }

  void _onLimpiar(LimpiarImagenEvent event, Emitter<ImagenState> emit) {
    _imagenes.clear();
    emit(ImagenInitial());
  }
}
