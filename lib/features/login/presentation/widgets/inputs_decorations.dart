import 'package:flutter/material.dart';

class InputsDecorations {
  static InputDecoration inputsDecorationUsuario({required String text}) {
    return InputDecoration(labelText: text, border: OutlineInputBorder());
  }
}
