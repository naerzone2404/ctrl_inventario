import 'package:flutter/material.dart';

class ComboBox extends StatefulWidget {
  const ComboBox({
    super.key,
    required this.texto,
    required this.items,
    this.valorObtenido,
    required this.cambiar,
  });
  final String texto;
  final List<String> items;
  final String? valorObtenido;
  final ValueChanged<String?> cambiar;

  @override
  State<ComboBox> createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.valorObtenido,
      items: widget.items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: widget.texto,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.blueGrey),
        ),
      ),
      onChanged: widget.cambiar,
    );
  }
}
