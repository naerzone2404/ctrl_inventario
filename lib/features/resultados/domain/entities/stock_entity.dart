import 'package:equatable/equatable.dart';

class StockEntity extends Equatable {
  final String id;
  final String zona;
  final String stand;
  final String col;
  final String fil;
  final String cantidad;
  final List<String> imgs;

  const StockEntity({
    required this.id,
    required this.zona,
    required this.stand,
    required this.col,
    required this.fil,
    required this.cantidad,
    required this.imgs,
  });

  @override
  List<Object?> get props => [id, zona, stand, col, fil, cantidad, imgs];
}
