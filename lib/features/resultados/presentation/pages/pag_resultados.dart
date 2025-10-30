import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/pages/page_nueva_ubicacion.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock/stock_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock/stock_event.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_sistema/stock_sistema_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_sistema/stock_sistema_event.dart';
import 'package:practicando_clean/features/resultados/presentation/pages/cuadro_stock_fisico.dart';
import 'package:practicando_clean/features/resultados/presentation/pages/cuadro_stock_sistema.dart';

class PagResultados extends StatefulWidget {
  const PagResultados({super.key, required this.codigo, required this.usuario});
  final String codigo;
  final String usuario;

  @override
  State<PagResultados> createState() => _PagResultadosState();
}

class _PagResultadosState extends State<PagResultados> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StockBloc>().add(EventoStockObtenido(codigo: widget.codigo));
      context.read<StockSistemaBloc>().add(
        ObtenerStockSistema(codigo: widget.codigo),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Codigo: ${widget.codigo}'),
            expandedHeight: 50,
            pinned: true,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text('Usuario: ${widget.usuario}'),
                Card(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 25,
                      horizontal: 5,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'STOCK SISTEMA',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ALMACEN'),
                            SizedBox(width: 50),
                            Text('STOCK'),
                          ],
                        ),
                        CuadroStockSistema(),
                        SizedBox(height: 10),
                        CuadroStockFisico(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final descrip =context.read<StockBloc>().add()
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  PageNuevaUbicacion(
                    codigo: widget.codigo,
                    descripcion: '',
                    usuario: widget.usuario,
                  ),
              transitionDuration: const Duration(microseconds: 500),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(
                          scale: Tween<double>(
                            begin: 0.8,
                            end: 1.0,
                          ).animate(animation),
                          child: child,
                        ),
                      ),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add_reaction, color: Colors.lightBlueAccent),
      ),
    );
  }
}
