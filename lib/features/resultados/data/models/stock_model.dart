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
  List<String> imgs;

  StockModel({
    required this.id,
    required this.zona,
    required this.stand,
    required this.col,
    required this.fil,
    required this.cantidad,
    required this.imgs,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    List<String> pasearImgs = [];

    try {
      final raw = json['Img'] ?? '[]';
      print('lista decodificada --> $raw');
      final decoded = jsonDecode(raw);
      print('lista decodificada --> $decoded');
      if (decoded is List) {
        pasearImgs = decoded.map((e) => e.toString()).toList();
      }
    } catch (e) {
      print('Error al parsear imagenes: $e');
    }
    return StockModel(
      id: json["id"] ?? '',
      zona: json["Zona"] ?? '',
      stand: json["Stand"] ?? '',
      col: json["col"] ?? '',
      fil: json["fil"] ?? '',
      cantidad: json["Cantidad"] ?? '',
      imgs: pasearImgs,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "Zona": zona,
    "Stand": stand,
    "col": col,
    "fil": fil,
    "Cantidad": cantidad,
    "Img": imgs,
  };

  StockEntity toEntity() {
    return StockEntity(
      id: id,
      zona: zona,
      stand: stand,
      col: col,
      fil: fil,
      cantidad: cantidad,
      imgs: imgs,
    );
  }
}
