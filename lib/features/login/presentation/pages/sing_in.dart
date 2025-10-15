import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/login/presentation/bloc/usuario_bloc.dart';
import 'package:practicando_clean/features/login/presentation/bloc/usuario_event.dart';
import 'package:practicando_clean/features/login/presentation/bloc/usuario_state.dart';
import 'package:practicando_clean/features/login/presentation/pages/pag_principal.dart';
import 'package:practicando_clean/features/login/presentation/widgets/inputs_decorations.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final _fomrKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UsuarioBloc, UsuarioState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _fomrKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _username,
                      keyboardType: TextInputType.number,
                      decoration: InputsDecorations.inputsDecorationUsuario(
                        text: 'Usuario@gmail.com',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese usuario';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _password,
                      keyboardType: TextInputType.number,
                      decoration: InputsDecorations.inputsDecorationUsuario(
                        text: 'Contraseña',
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Ingrese Contraseña'
                          : null,
                    ),
                    SizedBox(height: 16),
                    if (state is UsuarioLoading)
                      Center(child: CircularProgressIndicator())
                    else
                      ElevatedButton(
                        onPressed: () {
                          if (_fomrKey.currentState!.validate()) {
                            context.read<UsuarioBloc>().add(
                              UsuarioIniciadoSesion(
                                pass: _password.text,
                                uss: _username.text,
                              ),
                            );
                          }
                        },
                        child: const Text('Iniciar Sesión'),
                      ),
                    if (state is UsuarioAuthError) ...[
                      const SizedBox(height: 16),
                      Text(
                        state.message,
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is UsuarioAutenticado) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => PagPrincipal(
                  usuario:
                      state.usuarioEntitiy.usuario ?? 'Usuario desconocido',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
