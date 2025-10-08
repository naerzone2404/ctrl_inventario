import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/login/data/datasource/usuario_remote_datasource.dart';
import 'package:practicando_clean/features/login/data/repository_impl/usuario_repository_impl.dart';
import 'package:practicando_clean/features/login/domain/usecase/get_usuario_usecase.dart';
import 'package:practicando_clean/features/login/presentation/bloc/usuario_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:practicando_clean/features/login/presentation/pages/sing_in.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_) => UsuarioBloc(
          getUsuarioUsecase: GetUsuarioUsecase(
            UsuarioRepositoryImpl(
              usuarioRemoteDatasource: UsuarioRemoteDatasourceImpl(
                client: http.Client(),
              ),
            ),
          ),
        ),
        child: const SingIn(),
      ),
    );
  }
}
