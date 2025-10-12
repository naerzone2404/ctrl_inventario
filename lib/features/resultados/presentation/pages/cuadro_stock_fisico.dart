import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_event.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_state.dart';

class CuadroStockFisico extends StatefulWidget {
  const CuadroStockFisico({super.key, required this.codigo});
  final String codigo;

  @override
  State<CuadroStockFisico> createState() => _CuadroStockFisicoState();
}

class _CuadroStockFisicoState extends State<CuadroStockFisico> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StockBloc>().add(EventoStockObtenido(codigo: widget.codigo));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        if (state is StateStockLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is StateStockCargado) {
          final listStock = state.stockLista;
          return Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final s = listStock[index];
                return Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text(s.)
                          ],
                        ),
                      ),
                      Text('Zona ${s.zona} - Stand ${s.stand}'),
                      Text(s.cantidad),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => Divider(),
              itemCount: listStock.length,
            ),
          );
        } else if (state is StateStockError) {
          return Padding(
            padding: EdgeInsets.all(15),
            child: Text(state.message, style: TextStyle(color: Colors.red)),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
