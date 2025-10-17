import 'package:equatable/equatable.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/stand_entity.dart';

abstract class StandState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StandInitial extends StandState {}

class StandLoading extends StandState {}

class StandObtenido extends StandState {
  final List<StandEntity> stand;

  StandObtenido(this.stand);
  @override
  List<Object?> get props => [stand];
}

class StandError extends StandState {
  final String message;
  StandError(this.message);
  @override
  List<Object?> get props => [message];
}
