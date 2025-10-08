import 'package:equatable/equatable.dart';

class StockEntity extends Equatable {
  final String id;
  final String zona;
  final String stand;
  final String col;
  final String fil;
  final String cantidad;
  final String img;

  const StockEntity({
    required this.id,
    required this.zona,
    required this.stand,
    required this.col,
    required this.fil,
    required this.cantidad,
    required this.img,
  });

  factory StockEntity.fromJson(Map<String, dynamic> json) => StockEntity(
    id: json["id"],
    zona: json["Zona"],
    stand: json["Stand"],
    col: json["col"],
    fil: json["fil"],
    cantidad: json["Cantidad"],
    img: json["Img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Zona": zona,
    "Stand": stand,
    "col": col,
    "fil": fil,
    "Cantidad": cantidad,
    "Img": img,
  };

  @override
  List<Object?> get props => [id, zona, stand, col, fil, cantidad, img];
}
