import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class UbicacionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InsertarUbicacionEvent extends UbicacionEvent {
  final String search;
  final String zona;
  final String stand;
  final String col;
  final String fil;
  final String cantidad;
  final String usuario;
  final List<File> imagenes;

  InsertarUbicacionEvent({
    required this.search,
    required this.zona,
    required this.stand,
    required this.col,
    required this.fil,
    required this.cantidad,
    required this.usuario,
    required this.imagenes,
  });
  @override
  List<Object?> get props => [
    search,
    zona,
    stand,
    col,
    fil,
    cantidad,
    usuario,
    imagenes,
  ];
}
