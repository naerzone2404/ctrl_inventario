import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/stand/stand_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/stand/stand_state.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/widgets/combo_box_string.dart';

class SatndBlocComboBox extends StatefulWidget {
  const SatndBlocComboBox({
    super.key,
    required this.colorPrincipal,
    required this.standSeleccionado,
  });
  final Color colorPrincipal;
  final Function(String?) standSeleccionado;

  @override
  State<SatndBlocComboBox> createState() => _SatndBlocComboBoxState();
}

class _SatndBlocComboBoxState extends State<SatndBlocComboBox> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandBloc, StandState>(
      builder: (context, state) {
        if (state is StandLoading) {
          return Center(
            child: LoadingAnimationWidget.threeRotatingDots(
              color: widget.colorPrincipal,
              size: 40,
            ),
          );
        } else if (state is StandObtenido) {
          return ComboBoxString(
            hintText: 'STAND',
            items: state.stand
                .map((s) => {'id': s.id, 'descripcion': s.descripcion})
                .toList(),
            onChanged: widget.standSeleccionado,
            validator: (String? value) =>
                value == null ? 'Campo requerido' : null,
          );
        } else if (state is StandError) {
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
