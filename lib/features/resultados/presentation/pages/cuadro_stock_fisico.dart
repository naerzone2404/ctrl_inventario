import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock/stock_bloc.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock/stock_state.dart';
import 'package:practicando_clean/features/resultados/presentation/widgets/datos_ubicacion.dart';

class CuadroStockFisico extends StatefulWidget {
  const CuadroStockFisico({super.key});

  @override
  State<CuadroStockFisico> createState() => _CuadroStockFisicoState();
}

class _CuadroStockFisicoState extends State<CuadroStockFisico> {
  double scale = 1.0;
  double zoomInFactor = 1.5;
  bool isZooming = false;

  void onDoubleTap() {
    setState(() {
      isZooming = !isZooming;
      scale = (scale == 1.0) ? zoomInFactor : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        if (state is StateStockLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is StateStockCargado) {
          final listStock = state.stockLista;
          return Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.orange, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final s = listStock[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      s.imgs.isEmpty
                          ? CircleAvatar(
                              maxRadius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.image_aspect_ratio,
                                color: Colors.black,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 20,
                                        ),
                                        height: size.height * 0.65,
                                        width: size.width * 0.89,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: Card(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 20,
                                              horizontal: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Imagenes',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                if (s.imgs.isNotEmpty)
                                                  Center(
                                                    child: SizedBox(
                                                      height: size.height * 0.5,
                                                      width: size.width * 0.7,
                                                      child: PageView.builder(
                                                        itemCount:
                                                            s.imgs.length,
                                                        onPageChanged: isZooming
                                                            ? null
                                                            : (index) {},
                                                        itemBuilder: (context, index) {
                                                          final imagenUrl =
                                                              s.imgs[index];
                                                          print(
                                                            'datos de imagenes ${imagenUrl}',
                                                          );
                                                          if (imagenUrl
                                                              .isEmpty) {
                                                            return const Center(
                                                              child: Icon(
                                                                Icons
                                                                    .broken_image,
                                                                size: 100,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            );
                                                          } else {
                                                            return InkWell(
                                                              onDoubleTap:
                                                                  onDoubleTap,
                                                              child: InteractiveViewer(
                                                                panEnabled:
                                                                    !isZooming,
                                                                minScale: 0.5,
                                                                maxScale: 4.0,
                                                                child: Image.network(
                                                                  imagenUrl,
                                                                  height:
                                                                      size.height *
                                                                      0.8,
                                                                  width:
                                                                      size.width *
                                                                      0.99,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  loadingBuilder:
                                                                      (
                                                                        context,
                                                                        child,
                                                                        loadingProgress,
                                                                      ) {
                                                                        if (loadingProgress ==
                                                                            null) {
                                                                          return child;
                                                                        } else {
                                                                          return const SizedBox(
                                                                            height:
                                                                                100,
                                                                            width:
                                                                                100,
                                                                            child: Image(
                                                                              image: AssetImage(
                                                                                'assets/animation/mont.gif',
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                  errorBuilder:
                                                                      (
                                                                        context,
                                                                        error,
                                                                        stackTrace,
                                                                      ) => Icon(
                                                                        Icons
                                                                            .broken_image,
                                                                        size:
                                                                            100,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                else
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 30,
                                                    ),
                                                    child: Text(
                                                      "No hay Imagenes disponibles",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                const SizedBox(height: 10),
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text('Cerrar'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: CircleAvatar(
                                maxRadius: 30,
                                backgroundColor: Colors.deepOrangeAccent,
                                child: Icon(Icons.image_outlined),
                              ),
                            ),
                      // cuadro diferente
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text(s.)
                            DatosUbicacion(texto1: 'Zona: ', valor1: s.zona),
                            DatosUbicacion(texto1: 'Stand: ', valor1: s.stand),
                            DatosUbicacion(texto1: 'Columna: ', valor1: s.col),
                            DatosUbicacion(texto1: 'Fila: ', valor1: s.fil),
                            DatosUbicacion(
                              texto1: 'Stock: ',
                              valor1: s.cantidad,
                            ),
                          ],
                        ),
                      ),
                      // Boton de eliminar
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => Divider(color: Colors.orange),
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
