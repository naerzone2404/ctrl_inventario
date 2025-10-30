import 'package:flutter/material.dart';
import 'package:practicando_clean/features/resultados/presentation/pages/buscar_producto.dart';

class PagPrincipal extends StatefulWidget {
  const PagPrincipal({super.key, required this.usuario});
  final String usuario;
  @override
  State<PagPrincipal> createState() => _PagPrincipalState();
}

class _PagPrincipalState extends State<PagPrincipal> {
  int indice = 0;
  List<Widget> get vistas => [
    BuscarProducto(usuario: widget.usuario),
    Center(child: Text('Pag 2')),
    Center(child: Text('Pag 3')),
  ];

  void _seleccionarIndice(int index) {
    setState(() {
      print('obtener el valor del usuario --------->> ${widget.usuario}');
      indice = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: vistas[indice],
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.only(bottom: 2),
        child: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: Colors.red),
          selectedLabelStyle: TextStyle(color: Colors.red),
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          currentIndex: indice,
          elevation: 50,
          onTap: _seleccionarIndice,
          items: [
            BottomNavigationBarItem(
              label: 'Diferencia',
              icon: Icon(
                Icons.edit_document,
                color: indice == 0 ? Colors.blue : Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Buscar',
              icon: Icon(
                Icons.search,
                color: indice == 1 ? Colors.blue : Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Salir',
              icon: Icon(
                Icons.logout,
                color: indice == 2 ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
