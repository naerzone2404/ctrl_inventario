import 'package:equatable/equatable.dart';

abstract class ImagenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SeleccionarDesdeGaleria extends ImagenEvent {}

class TomarFotoEvent extends ImagenEvent {}

class EliminarImagenEvent extends ImagenEvent {
  final int index;
  EliminarImagenEvent(this.index);
  @override
  List<Object?> get props => [index];
}

class LimpiarImagenEvent extends ImagenEvent {}
