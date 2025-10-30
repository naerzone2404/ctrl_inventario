import 'package:flutter/material.dart';

class InputsDecorations {
  static InputDecoration inputsDecorationUsuario({required String text}) {
    return InputDecoration(labelText: text, border: OutlineInputBorder());
  }

  static InputDecoration inputsDecorationGlobal({
    required String text,
    required Icon icons,
  }) {
    return InputDecoration(
      prefixIcon: icons,
      labelText: text,
      border: OutlineInputBorder(),
    );
  }
}
