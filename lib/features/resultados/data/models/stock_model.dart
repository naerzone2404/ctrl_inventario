// To parse this JSON data, do
//
//     final stockModel = stockModelFromJson(jsonString);

import 'dart:convert';

import 'package:practicando_clean/features/resultados/domain/entities/stock_entity.dart';

List<StockModel> stockModelFromJson(String str) =>
    List<StockModel>.from(json.decode(str).map((x) => StockModel.fromJson(x)));

String stockModelToJson(List<StockModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockModel {
  String id;
  String zona;
  String stand;
  String col;
  String fil;
  String cantidad;
  String img;

  StockModel({
    required this.id,
    required this.zona,
    required this.stand,
    required this.col,
    required this.fil,
    required this.cantidad,
    required this.img,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
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

  StockEntity toEntity() {
    return StockEntity(
      id: id,
      zona: zona,
      stand: stand,
      col: col,
      fil: fil,
      cantidad: cantidad,
      img: img,
    );
  }
}
