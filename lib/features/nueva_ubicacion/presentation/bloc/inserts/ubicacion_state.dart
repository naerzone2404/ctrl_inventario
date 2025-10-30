import 'package:equatable/equatable.dart';

abstract class UbicacionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UbicacionInitial extends UbicacionState {}

class UbicacionLoading extends UbicacionState {}

class UbicacionSucces extends UbicacionState {
  final String mensaje;
  UbicacionSucces(this.mensaje);
  @override
  List<Object?> get props => [mensaje];
}

class UbicacionError extends UbicacionState {
  final String message;
  UbicacionError(this.message);

  @override
  List<Object?> get props => [message];
}
