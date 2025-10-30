import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/zona/zona_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/zona/zona_state.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/widgets/combo_box_string.dart';

class ZonaBlocCombobox extends StatefulWidget {
  const ZonaBlocCombobox({
    super.key,
    required this.colorPrincial,
    required this.zonaSeleccionado,
  });
  final Color colorPrincial;
  final Function(String?) zonaSeleccionado;

  @override
  State<ZonaBlocCombobox> createState() => _ZonaBlocComboboxState();
}

class _ZonaBlocComboboxState extends State<ZonaBlocCombobox> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZonaBloc, ZonaState>(
      builder: (context, state) {
        if (state is ZonaLoading) {
          return Center(
            child: LoadingAnimationWidget.threeRotatingDots(
              color: widget.colorPrincial,
              size: 50,
            ),
          );
        } else if (state is ZonaObtenida) {
          return ComboBoxString(
            hintText: 'ZONA',
            items: state.zonas
                .map((s) => {'id': s.id, 'descripcion': s.descripcion})
                .toList(),
            onChanged: widget.zonaSeleccionado,
            validator: (String? value) =>
                value == null ? 'Campo requerido' : null,
          );
        } else if (state is ZonaError) {
          return Text(
            'Error: ${state.message}',
            style: const TextStyle(color: Colors.red),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
