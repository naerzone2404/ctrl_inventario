import 'package:bloc/bloc.dart';
import 'package:practicando_clean/features/login/domain/usecase/get_usuario_usecase.dart';
import 'package:practicando_clean/features/login/presentation/bloc/usuario_event.dart';
import 'package:practicando_clean/features/login/presentation/bloc/usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final GetUsuarioUsecase getUsuarioUsecase;

  UsuarioBloc({required this.getUsuarioUsecase}) : super(UsuarioInitial()) {
    on<UsuarioIniciadoSesion>((event, emit) async {
      emit(UsuarioLoading());
      final result = await getUsuarioUsecase(event.uss, event.pass);

      result.fold((failure) => emit(UsuarioAuthError(failure.message)), (
        usuarioResponse,
      ) {
        if (usuarioResponse.valid) {
          emit(UsuarioAutenticado(usuarioResponse));
        } else {
          emit(UsuarioAuthError(usuarioResponse.message));
        }
      });
    });
    on<UsuarioCerrarSesion>((event, emit) {
      emit(UsuarioInitial());
    });
  }
}
