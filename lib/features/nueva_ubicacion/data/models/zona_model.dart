// To parse this JSON data, do
//
//     final zonaModel = zonaModelFromJson(jsonString);

import 'dart:convert';

import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/zona_entity.dart';

List<ZonaModel> zonaModelFromJson(String str) =>
    List<ZonaModel>.from(json.decode(str).map((x) => ZonaModel.fromJson(x)));

String zonaModelToJson(List<ZonaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ZonaModel {
  String id;
  String descripcion;

  ZonaModel({required this.id, required this.descripcion});

  factory ZonaModel.fromJson(Map<String, dynamic> json) =>
      ZonaModel(id: json["id"], descripcion: json["descripcion"]);

  Map<String, dynamic> toJson() => {"id": id, "descripcion": descripcion};

  ZonaEntity toZonaEntity() {
    return ZonaEntity(id: id, descripcion: descripcion);
  }
}
