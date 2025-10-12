import 'dart:convert';

import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/resultados/data/models/stock_model.dart';
import 'package:http/http.dart' as http;
import 'package:practicando_clean/features/resultados/data/models/stock_sistema_model.dart';

abstract class StockRemoteDatasource {
  Future<List<StockModel>> obtenerApiStock({required String codProcuto});
  Future<List<StockSistemaModel>> obtenerApiSistema({required String codigo});
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
      throw ServerFailure('Error al obtener datos(Fisico) del servidor web');
    }
  }

  @override
  Future<List<StockSistemaModel>> obtenerApiSistema({
    required String codigo,
  }) async {
    final url = Uri.parse(
      'http://192.168.1.100/control_inventary/flutter_ajax.php?search=$codigo',
    );

    final responseSistema = await client.get(url);
    if (responseSistema.statusCode == 200) {
      final List<dynamic> jsonStockSistema = jsonDecode(responseSistema.body);
      return jsonStockSistema
          .map((system) => StockSistemaModel.fromJson(system))
          .toList();
    } else {
      throw ServerFailure('Error al obtener datos(Sistema) del servidor web');
    }
  }
}
