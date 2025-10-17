import 'package:equatable/equatable.dart';

class StandEntity extends Equatable {
  final String id;
  final String descripcion;

  const StandEntity({required this.id, required this.descripcion});

  @override
  List<Object?> get props => [id, descripcion];
}
