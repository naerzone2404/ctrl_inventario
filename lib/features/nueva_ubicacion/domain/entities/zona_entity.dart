import 'package:equatable/equatable.dart';

class ZonaEntity extends Equatable {
  final String id;
  final String descripcion;

  const ZonaEntity({required this.id, required this.descripcion});

  @override
  List<Object?> get props => [id, descripcion];
}
