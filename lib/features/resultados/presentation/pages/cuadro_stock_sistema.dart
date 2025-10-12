import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_event.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_state.dart';

class CuadroStockSistema extends StatefulWidget {
  const CuadroStockSistema({super.key, required this.codigo});
  final String codigo;

  @override
  State<CuadroStockSistema> createState() => _CuadroStockSistemaState();
}

class _CuadroStockSistemaState extends State<CuadroStockSistema> {
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
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    children: [
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
