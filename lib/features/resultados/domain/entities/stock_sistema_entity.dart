import 'package:equatable/equatable.dart';

class StockSistemaEntity extends Equatable {
  final String compaia;
  final String item;
  final String estado;
  final String name;
  final String itemCode;
  final String stock;
  final String linea;
  final String familia;
  final String subfamilia;
  final String itemdescripcion;
  final String pesoGramaje;
  final String? volumenCalibre;
  final String largo;
  final String ancho;
  final String marca;
  final String unit;

  const StockSistemaEntity({
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

  @override
  List<Object?> get props => [
    compaia,
    item,
    estado,
    name,
    itemCode,
    stock,
    linea,
    familia,
    subfamilia,
    itemdescripcion,
    pesoGramaje,
    volumenCalibre,
    largo,
    ancho,
    marca,
    unit,
  ];
}
