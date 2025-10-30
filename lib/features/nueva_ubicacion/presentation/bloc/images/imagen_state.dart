import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ImagenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImagenInitial extends ImagenState {}

class ImageLoading extends ImagenState {}

class ImagenCargadoObtenida extends ImagenState {
  final List<File> imagenes;
  ImagenCargadoObtenida(this.imagenes);
  @override
  List<Object?> get props => [imagenes];
}

class ImagenError extends ImagenState {
  final String mensaje;
  ImagenError(this.mensaje);
  @override
  List<Object?> get props => [mensaje];
}
