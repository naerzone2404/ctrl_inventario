import 'dart:convert';

import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/models/stand_model.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/models/zona_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/ubicacion_entity.dart';

abstract class CoordenadasRemoteDatasource {
  Future<List<ZonaModel>> getZonas();
  Future<List<StandModel>> getStand();
  Future<String> insertarUbicacion(UbicacionEntity ubicacion);
}

class CoordenadasRemoteDatasourceImpl extends CoordenadasRemoteDatasource {
  final http.Client client;
  CoordenadasRemoteDatasourceImpl({required this.client});

  @override
  Future<List<ZonaModel>> getZonas() async {
    final linkZona = Uri.parse(
      'http://192.168.1.100/control_inventary/flutter_ajax_zona.php',
    );

    final response = await client.get(linkZona);
    if (response.statusCode == 200) {
      final List<dynamic> dataZona = jsonDecode(response.body);
      return dataZona.map((z) => ZonaModel.fromJson(z)).toList();
    } else {
      throw ServerFailure('Error al obtener zonas');
    }
  }

  @override
  Future<List<StandModel>> getStand() async {
    final linkStand = Uri.parse(
      'http://192.168.1.100/control_inventary/flutter_ajax_stand.php',
    );

    final response = await client.get(linkStand);
    if (response.statusCode == 200) {
      final List<dynamic> dataStand = jsonDecode(response.body);
      return dataStand.map((s) => StandModel.fromJson(s)).toList();
    } else {
      throw ServerFailure('Error al obtener los Stand');
    }
  }

  @override
  Future<String> insertarUbicacion(UbicacionEntity ubicacion) async {
    final url = Uri.parse(
      'http://192.168.1.100/control_inventary/flutter_ajax_add.php',
    );

    final request = http.MultipartRequest('POST', url);
    request.fields['search'] = ubicacion.search;
    request.fields['zona'] = ubicacion.zona;
    request.fields['stand'] = ubicacion.stand;
    request.fields['col'] = ubicacion.col;
    request.fields['fil'] = ubicacion.fil;
    request.fields['cantidad'] = ubicacion.cantidad;
    request.fields['usuario'] = ubicacion.usuario;
    print('search: ${ubicacion.search}');
    print('zona: ${ubicacion.zona}');
    print('stand: ${ubicacion.stand}');
    print('col: ${ubicacion.col}');
    print('fil: ${ubicacion.fil}');
    print('cantidad: ${ubicacion.cantidad}');
    print('usuario: ${ubicacion.usuario}');

    for (var imagen in ubicacion.imagenes) {
      print('lista-----> : ${ubicacion.imagenes}');
      request.files.add(
        await http.MultipartFile.fromPath(
          'img[]',
          imagen.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
    }

    final response = await request.send();
    if (response.statusCode == 200) {
      final responsebody = await response.stream.bytesToString();
      final data = jsonDecode(responsebody);
      return data.toString();
    } else {
      throw Exception('Error al enviar datos al servidor');
    }
  }
}
