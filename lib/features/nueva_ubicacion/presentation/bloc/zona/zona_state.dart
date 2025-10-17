import 'package:equatable/equatable.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/zona_entity.dart';

abstract class ZonaState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ZonaInitial extends ZonaState {}

class ZonaLoading extends ZonaState {}

class ZonaObtenida extends ZonaState {
  final List<ZonaEntity> zonas;
  ZonaObtenida(this.zonas);

  @override
  List<Object?> get props => [];
}

class ZonaError extends ZonaState {
  final String message;
  ZonaError(this.message);
  @override
  List<Object?> get props => [message];
}
