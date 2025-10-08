import 'dart:convert';

import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/login/data/models/usuario_model.dart';
import 'package:http/http.dart' as http;

abstract class UsuarioRemoteDatasource {
  Future<UsuarioModel> iniciarSesionDatasource(String uss, String pass);
}

class UsuarioRemoteDatasourceImpl implements UsuarioRemoteDatasource {
  final http.Client client;

  UsuarioRemoteDatasourceImpl({required this.client});

  @override
  Future<UsuarioModel> iniciarSesionDatasource(String uss, String pass) async {
    final link = Uri.parse(
      'http://192.168.1.100/control_inventary/flutter_ajax_token?uss=$uss&pass=$pass',
    );
    print('usuario --->> $uss  y password --> $pass');
    final response = await client.get(link);
    if (response.statusCode == 200) {
      try {
        final dataCuerpo = jsonDecode(response.body);
        print('deste AuthDatasourceImpl --->> $dataCuerpo ');
        return UsuarioModel.fromJson(dataCuerpo);
      } catch (e) {
        throw ServerFailure('Error al parsear el cuerpo de la API');
      }
    } else {
      throw ServerFailure('Error al conectar con el servidor web');
    }
  }
}
