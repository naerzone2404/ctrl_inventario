import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_sistema/stock_sistema_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_sistema/stock_sistema_state.dart';

class CuadroStockSistema extends StatelessWidget {
  const CuadroStockSistema({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockSistemaBloc, StockSistemaState>(
      builder: (context, state) {
        if (state is StockSistemaLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is StockSistemaCargado) {
          final listaStockSistema = state.stockSystem;
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final indiceStock = listaStockSistema[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(indiceStock.name)],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Text(indiceStock.stock)],
                  ),
                ],
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: listaStockSistema.length,
          );
        } else if (state is StockSistemaError) {
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
