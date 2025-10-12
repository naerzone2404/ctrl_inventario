import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/login/presentation/widgets/inputs_decorations.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/pages/pag_resultados.dart';

class BuscarProducto extends StatefulWidget {
  const BuscarProducto({super.key});

  @override
  State<BuscarProducto> createState() => _BuscarProductoState();
}

class _BuscarProductoState extends State<BuscarProducto> {
  final _insertarCodigo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Consultale a almacen'),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  height: 50,
                  child: TextFormField(
                    controller: _insertarCodigo,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputsDecorations.inputsDecorationUsuario(
                      text: 'Codigo producto. ',
                    ),
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: context.read<StockBloc>(),
                              child: PagResultados(
                                codigo: _insertarCodigo.text,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.qr_code_2_outlined, size: 65),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
