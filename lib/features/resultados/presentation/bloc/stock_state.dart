import 'package:equatable/equatable.dart';
import 'package:practicando_clean/features/resultados/domain/entities/stock_entity.dart';

abstract class StockState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StateStockInitial extends StockState {}

class StateStockLoading extends StockState {}

class StateStockCargado extends StockState {
  final List<StockEntity> stockLista;

  StateStockCargado(this.stockLista);
  @override
  List<Object?> get props => [stockLista];
}

class StateStockError extends StockState {
  final String message;
  StateStockError(this.message);
  @override
  List<Object?> get props => [message];
}
