import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/login/data/datasource/usuario_remote_datasource.dart';
import 'package:practicando_clean/features/login/data/repository_impl/usuario_repository_impl.dart';
import 'package:practicando_clean/features/login/domain/usecase/get_usuario_usecase.dart';
import 'package:practicando_clean/features/login/presentation/bloc/usuario_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:practicando_clean/features/login/presentation/pages/sing_in.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/datasource/coordenadas_remote_datasource.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/datasource/imagen_datasource.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/repository_impl/coordenadas_repository_impl.dart';
import 'package:practicando_clean/features/nueva_ubicacion/data/repository_impl/imagen_repository_impl.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/usecase/coordenadas_usecase.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/usecase/insertar_ubicacion_usecase.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/usecase/seleccionar_imagenes_usecase.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/usecase/tomar_foto_usecase.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/inserts/ubicacion_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/stand/stand_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/zona/zona_bloc.dart';
import 'package:practicando_clean/features/resultados/data/datasource/stock_remote_datasource.dart';
import 'package:practicando_clean/features/resultados/data/reposistory_impl/stock_repository_impl.dart';
import 'package:practicando_clean/features/resultados/domain/usecase/get_stock_usecase.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock/stock_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_sistema/stock_sistema_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UsuarioBloc(
            getUsuarioUsecase: GetUsuarioUsecase(
              UsuarioRepositoryImpl(
                usuarioRemoteDatasource: UsuarioRemoteDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => StockBloc(
            getStockUsecase: GetStockUsecase(
              StockRepositoryImpl(
                stockRemoteDatasource: StockRemoteDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => StockSistemaBloc(
            getStockSistemaUsecase: GetStockUsecase(
              StockRepositoryImpl(
                stockRemoteDatasource: StockRemoteDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => StandBloc(
            coordenadasUsecase: CoordenadasUsecase(
              CoordenadasRepositoryImpl(
                remoteDatasource: CoordenadasRemoteDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => ZonaBloc(
            coordUsecase: CoordenadasUsecase(
              CoordenadasRepositoryImpl(
                remoteDatasource: CoordenadasRemoteDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => ImagenBloc(
            seleccionarUsecase: SeleccionarImagenesUsecase(
              ImagenRepositoryImpl(datasource: ImagenDataSourceImpl()),
            ),
            tomarFotoUsecase: TomarFotoUsecase(
              ImagenRepositoryImpl(datasource: ImagenDataSourceImpl()),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => UbicacionBloc(
            insertarUbicacion: InsertarUbicacionUsecase(
              CoordenadasRepositoryImpl(
                remoteDatasource: CoordenadasRemoteDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 28, 95, 184),
          ),
        ),
        home: const SingIn(),
      ),
    );
  }
}
