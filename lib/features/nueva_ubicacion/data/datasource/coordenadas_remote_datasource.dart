import 'dart:convert';

import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/models/stand_model.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/models/zona_model.dart';
import 'package:http/http.dart' as http;

abstract class CoordenadasRemoteDatasource {
  Future<List<ZonaModel>> getZonas();
  Future<List<StandModel>> getStand();
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
      final dataZona = jsonDecode(response.body);
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
      final dataStand = jsonDecode(response.body);
      return dataStand.map((s) => StandModel.fromJson(s)).toList();
    } else {
      throw ServerFailure('Error al obtener los Stand');
    }
  }
}
