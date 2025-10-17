import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/usecase/coordenadas_usecase.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/zona/zona_event.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/zona/zona_state.dart';

class ZonaBloc extends Bloc<ZonaEvent, ZonaState> {
  final CoordenadasUsecase coordUsecase;

  ZonaBloc({required this.coordUsecase}) : super(ZonaInitial()) {
    on<ObtenerLaZona>((event, emit) async {
      emit(ZonaLoading());
      final result = await coordUsecase.callZona();

      result.fold(
        (failure) => emit(ZonaError(failure.message)),
        (zonas) => emit(ZonaObtenida(zonas)),
      );
    });
  }
}
