import 'package:flutter/material.dart';

class ComboBoxString extends StatelessWidget {
  final String hintText;
  final String? seleccionarValor;
  final List<Map<String, String>> items;
  final Function(String?) onChanged;
  final FormFieldValidator<String>? validator;
  const ComboBoxString({
    super.key,
    required this.hintText,
    this.seleccionarValor,
    required this.items,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: seleccionarValor,
      hint: Text(hintText),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey[100],
      ),

      items: items.map((item) {
        return DropdownMenuItem(
          value: item['id'],
          child: Text(item['descripcion'] ?? ''),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
