// To parse this JSON data, do
//
//     final stockSistemaModel = stockSistemaModelFromJson(jsonString);

import 'dart:convert';

import 'package:practicando_clean/features/resultados/domain/entities/stock_sistema_entity.dart';

List<StockSistemaModel> stockSistemaModelFromJson(String str) =>
    List<StockSistemaModel>.from(
      json.decode(str).map((x) => StockSistemaModel.fromJson(x)),
    );

String stockSistemaModelToJson(List<StockSistemaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockSistemaModel {
  String compaia;
  String item;
  String estado;
  String name;
  String itemCode;
  String stock;
  String linea;
  String familia;
  String subfamilia;
  String itemdescripcion;
  String pesoGramaje;
  dynamic volumenCalibre;
  String largo;
  String ancho;
  String marca;
  String unit;

  StockSistemaModel({
    required this.compaia,
    required this.item,
    required this.estado,
    required this.name,
    required this.itemCode,
    required this.stock,
    required this.linea,
    required this.familia,
    required this.subfamilia,
    required this.itemdescripcion,
    required this.pesoGramaje,
    required this.volumenCalibre,
    required this.largo,
    required this.ancho,
    required this.marca,
    required this.unit,
  });

  factory StockSistemaModel.fromJson(Map<String, dynamic> json) =>
      StockSistemaModel(
        compaia: json["compañia"] ?? '',
        item: json["item"] ?? '',
        estado: json["estado"] ?? '',
        name: json["Name"] ?? '',
        itemCode: json["ItemCode"] ?? '',
        stock: json["Stock"] ?? '',
        linea: json["linea"] ?? '',
        familia: json["familia"] ?? '',
        subfamilia: json["subfamilia"] ?? '',
        itemdescripcion: json["itemdescripcion"] ?? '',
        pesoGramaje: json["PESO(GRAMAJE)"] ?? '',
        volumenCalibre: json["VOLUMEN(CALIBRE)"] ?? '',
        largo: json["largo"] ?? '',
        ancho: json["ancho"] ?? '',
        marca: json["marca"] ?? '',
        unit: json["Unit"] ?? '',
      );

  Map<String, dynamic> toJson() => {
    "compañia": compaia,
    "item": item,
    "estado": estado,
    "Name": name,
    "ItemCode": itemCode,
    "Stock": stock,
    "linea": linea,
    "familia": familia,
    "subfamilia": subfamilia,
    "itemdescripcion": itemdescripcion,
    "PESO(GRAMAJE)": pesoGramaje,
    "VOLUMEN(CALIBRE)": volumenCalibre,
    "largo": largo,
    "ancho": ancho,
    "marca": marca,
    "Unit": unit,
  };
  StockSistemaEntity toEntity() {
    return StockSistemaEntity(
      compaia: compaia,
      item: item,
      estado: estado,
      name: name,
      itemCode: itemCode,
      stock: stock,
      linea: linea,
      familia: familia,
      subfamilia: subfamilia,
      itemdescripcion: itemdescripcion,
      pesoGramaje: pesoGramaje,
      volumenCalibre: volumenCalibre,
      largo: largo,
      ancho: ancho,
      marca: marca,
      unit: unit,
    );
  }
}
