import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:practicando_clean/features/constants/coordenada_fil_col.dart';
import 'package:practicando_clean/features/login/presentation/widgets/inputs_decorations.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_event.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/images/imagen_state.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/inserts/ubicacion_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/inserts/ubicacion_event.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/inserts/ubicacion_state.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/stand/stand_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/stand/stand_event.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/zona/zona_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/zona/zona_event.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/widgets/image_bloc_mostrar.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/widgets/image_bloc_serealizacion.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/widgets/stand_block_combobox.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/widgets/combo_box.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/widgets/zona_bloc_combobox.dart';

class PageNuevaUbicacion extends StatefulWidget {
  final String codigo;
  final String descripcion;
  final String usuario;
  const PageNuevaUbicacion({
    super.key,
    required this.codigo,
    required this.descripcion,
    required this.usuario,
  });

  @override
  State<PageNuevaUbicacion> createState() => _PageNuevaUbicacionState();
}

class _PageNuevaUbicacionState extends State<PageNuevaUbicacion> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? zonaSeleccionada;
  String? standSeleccionado;
  String? filaSeleccionada;
  String? columnaSeleccionada;
  final TextEditingController _cantidadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ZonaBloc>().add(ObtenerLaZona());
      context.read<StandBloc>().add(ObtenerStands());

      context.read<ImagenBloc>().add(LimpiarImagenEvent());
    });
  }

  @override
  void dispose() {
    _cantidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorPrincipal = const Color.fromARGB(255, 45, 48, 77);
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Codigo: ${widget.codigo}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: colorPrincipal,
        centerTitle: true,
      ),
      body: BlocListener<UbicacionBloc, UbicacionState>(
        listener: (context, state) {
          if (state is UbicacionLoading) {
            // opcional: mostrar diálogo o snackbar
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Enviando...')));
          } else if (state is UbicacionSucces) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Éxito: ${state.mensaje}')));
            // limpiar formulario si quieres:
            _cantidadController.clear();
            context.read<ImagenBloc>().add(LimpiarImagenEvent());
          } else if (state is UbicacionError) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
          }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.usuario,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                ZonaBlocCombobox(
                  colorPrincial: colorPrincipal,
                  zonaSeleccionado: (String? p1) {
                    setState(() {
                      print(standSeleccionado);
                      standSeleccionado = p1;
                    });
                  },
                ),

                const SizedBox(height: 8),

                SatndBlocComboBox(
                  colorPrincipal: colorPrincipal,
                  standSeleccionado: (String? p1) {
                    setState(() {
                      print(standSeleccionado);
                      standSeleccionado = p1;
                    });
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ComboBox(
                        texto: 'COLUMNA',
                        items: columna,
                        cambiar: (String? nuevoValor) {
                          columnaSeleccionada = nuevoValor;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ComboBox(
                        texto: 'FILA',
                        items: fila,
                        cambiar: (String? nuevoValor) {
                          filaSeleccionada = nuevoValor;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                TextFormField(
                  controller: _cantidadController,
                  keyboardType: TextInputType.number,
                  decoration: InputsDecorations.inputsDecorationGlobal(
                    text: 'CANTIDAD',
                    icons: Icon(Icons.numbers),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Campo requerido';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Ingrese un número valido';
                    }
                    return null;
                  },
                ),
                Text('Imagenes'),
                const SizedBox(height: 12),

                // Imagenes (BlocBuilder)
                //ImageBlocMostrar(colorPrincipal: colorPrincipal),
                BlocBuilder<ImagenBloc, ImagenState>(
                  builder: (context, state) {
                    if (state is ImageLoading) {
                      return Center(
                        child: LoadingAnimationWidget.threeRotatingDots(
                          color: colorPrincipal,
                          size: 40,
                        ),
                      );
                    } else if (state is ImagenCargadoObtenida) {
                      return _mostrarImagenes(context, state.imagenes);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const SizedBox(height: 14),
                // Botón para abrir modal opciones imagenes
                // AdjuntarImagen(colorPrincipal: colorPrincipal),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorPrincipal,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => _mostrarOpcionesDeImagenes(context),
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Adjuntar Imagen',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                // Botón enviar (usa UbicacionBloc)
                BlocBuilder<UbicacionBloc, UbicacionState>(
                  builder: (context, state) {
                    final isLoading = state is UbicacionLoading;
                    return ElevatedButton(
                      onPressed: isLoading ? null : () => _onEnviar(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrincipal,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Agregar',
                              style: TextStyle(fontSize: 16),
                            ),
                    );
                  },
                ),

                const SizedBox(height: 24),
                SizedBox(height: media.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mostrarOpcionesDeImagenes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      backgroundColor: Colors.white,
      builder: (modalContext) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Seleccionar una opción',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Divider(color: Colors.grey[300]),
                ListTile(
                  leading: const Icon(Icons.photo_library_outlined),
                  title: const Text(
                    'Galería',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.pop(modalContext); // cerrar el modal
                    // disparar evento del bloc para galería
                    context.read<ImagenBloc>().add(SeleccionarDesdeGaleria());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text(
                    'Cámara',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.pop(modalContext);
                    // disparar evento del bloc para cámara
                    context.read<ImagenBloc>().add(TomarFotoEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onEnviar(BuildContext context) {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return; // No se envia si hay errores
    }

    // Imagenes actuales desde ImagenBloc state
    final imagenState = context.read<ImagenBloc>().state;
    //final usuario = context.watch<UsuarioBloc>().state;
    List<File> imagenes = [];
    if (imagenState is ImagenCargadoObtenida) {
      imagenes = imagenState.imagenes;
    }
    print('imagenes-------------> $imagenes');

    // crear y despachar evento
    context.read<UbicacionBloc>().add(
      InsertarUbicacionEvent(
        search: widget.codigo,
        zona: zonaSeleccionada!,
        stand: standSeleccionado!,
        col: columnaSeleccionada!,
        fil: filaSeleccionada!,
        cantidad: _cantidadController.text.trim(),
        usuario: widget.usuario,
        imagenes: imagenes,
      ),
    );
  }

  Widget _mostrarImagenes(BuildContext context, List<File> imagenes) {
    if (imagenes.isEmpty) {
      return const Center(
        child: Text(
          'No hay imágenes seleccionadas',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imagenes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final file = imagenes[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(file, fit: BoxFit.cover),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: InkWell(
                onTap: () =>
                    context.read<ImagenBloc>().add(EliminarImagenEvent(index)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
