import 'package:flutter/material.dart';

class AgregarNuevaUbicacion extends StatefulWidget {
  const AgregarNuevaUbicacion({super.key});

  @override
  State<AgregarNuevaUbicacion> createState() => _AgregarNuevaUbicacionState();
}

class _AgregarNuevaUbicacionState extends State<AgregarNuevaUbicacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Aqui la descripción')),
              const SizedBox(height: 20),
              //DropdownButtonFormField(items: , onChanged: )
            ],
          ),
        ),
      ),
    );
  }
}
