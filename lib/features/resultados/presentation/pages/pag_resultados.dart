import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_event.dart';
import 'package:practicando_clean/features/resultados/presentation/pages/cuadro_stock_fisico.dart';

class PagResultados extends StatefulWidget {
  const PagResultados({super.key, required this.codigo});
  final String codigo;

  @override
  State<PagResultados> createState() => _PagResultadosState();
}

class _PagResultadosState extends State<PagResultados> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StockBloc>().add(EventoStockObtenido(codigo: widget.codigo));
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
                Text('Aqui va la descripcion del codigo'),
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
                        CuadroStockFisico(codigo: widget.codigo),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
