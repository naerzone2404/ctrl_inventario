import 'package:equatable/equatable.dart';

abstract class StockSistemaEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ObtenerStockSistema extends StockSistemaEvent {
  final String codigo;
  ObtenerStockSistema({required this.codigo});
  @override
  List<Object?> get props => [codigo];
}
