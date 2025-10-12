class StockSistemaEntity {
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
  String? volumenCalibre;
  String largo;
  String ancho;
  String marca;
  String unit;

  StockSistemaEntity({
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

  factory StockSistemaEntity.fromJson(Map<String, dynamic> json) =>
      StockSistemaEntity(
        compaia: json["compañia"],
        item: json["item"],
        estado: json["estado"],
        name: json["Name"],
        itemCode: json["ItemCode"],
        stock: json["Stock"],
        linea: json["linea"],
        familia: json["familia"],
        subfamilia: json["subfamilia"],
        itemdescripcion: json["itemdescripcion"],
        pesoGramaje: json["PESO(GRAMAJE)"],
        volumenCalibre: json["VOLUMEN(CALIBRE)"],
        largo: json["largo"],
        ancho: json["ancho"],
        marca: json["marca"],
        unit: json["Unit"],
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
}
