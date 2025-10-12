import 'dart:convert';

import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/resultados/data/models/stock_model.dart';
import 'package:http/http.dart' as http;

abstract class StockRemoteDatasource {
  Future<List<StockModel>> obtenerApiStock({required String codProcuto});
}

class StockRemoteDatasourceImpl implements StockRemoteDatasource {
  final http.Client client;

  StockRemoteDatasourceImpl({required this.client});

  @override
  Future<List<StockModel>> obtenerApiStock({required String codProcuto}) async {
    final link = Uri.parse(
      'http://192.168.1.100/control_inventary/flutter_ajax_ubi.php?search=$codProcuto',
    );
    print('el codigo: $codProcuto');
    final response = await client.get(link);
    if (response.statusCode == 200) {
      final List<dynamic> jsonStock = jsonDecode(response.body);
      print('Lista: $jsonStock');
      return jsonStock.map((stock) => StockModel.fromJson(stock)).toList();
    } else {
      throw ServerFailure('Error al obtener datos del servidor web');
    }
  }
}
