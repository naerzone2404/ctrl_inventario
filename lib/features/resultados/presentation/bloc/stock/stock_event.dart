import 'package:equatable/equatable.dart';

abstract class StockEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EventoStockObtenido extends StockEvent {
  final String codigo;

  EventoStockObtenido({required this.codigo});
  @override
  List<Object?> get props => [codigo];
}
