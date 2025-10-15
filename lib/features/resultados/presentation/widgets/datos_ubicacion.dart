import 'package:flutter/material.dart';

class DatosUbicacion extends StatelessWidget {
  const DatosUbicacion({super.key, required this.texto1, required this.valor1});
  final String texto1;
  final String valor1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: texto1,
                style: const TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: valor1,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
