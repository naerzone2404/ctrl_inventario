import 'package:equatable/equatable.dart';
import 'package:practicando_clean/features/resultados/domain/entities/stock_sistema_entity.dart';

abstract class StockSistemaState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StockSistemaInitial extends StockSistemaState {}

class StockSistemaLoading extends StockSistemaState {}

class StockSistemaCargado extends StockSistemaState {
  final List<StockSistemaEntity> stockSystem;

  StockSistemaCargado(this.stockSystem);
  @override
  List<Object?> get props => [stockSystem];
}

class StockSistemaError extends StockSistemaState {
  final String message;
  StockSistemaError(this.message);
  @override
  List<Object?> get props => [message];
}
