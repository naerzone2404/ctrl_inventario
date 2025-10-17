// To parse this JSON data, do
//
//     final standModel = standModelFromJson(jsonString);

import 'dart:convert';

import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/stand_entity.dart';

List<StandModel> standModelFromJson(String str) =>
    List<StandModel>.from(json.decode(str).map((x) => StandModel.fromJson(x)));

String standModelToJson(List<StandModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StandModel {
  String id;
  String descripcion;

  StandModel({required this.id, required this.descripcion});

  factory StandModel.fromJson(Map<String, dynamic> json) =>
      StandModel(id: json["id"], descripcion: json["descripcion"]);

  Map<String, dynamic> toJson() => {"id": id, "descripcion": descripcion};

  StandEntity toStandEntity() {
    return StandEntity(id: id, descripcion: descripcion);
  }
}
