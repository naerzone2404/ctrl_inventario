import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/entities/ubicacion_entity.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/usecase/insertar_ubicacion_usecase.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/inserts/ubicacion_event.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/inserts/ubicacion_state.dart';

class UbicacionBloc extends Bloc<UbicacionEvent, UbicacionState> {
  final InsertarUbicacionUsecase insertarUbicacion;
  UbicacionBloc({required this.insertarUbicacion}) : super(UbicacionInitial()) {
    on<InsertarUbicacionEvent>((event, emit) async {
      emit(UbicacionLoading());
      final ubicacion = UbicacionEntity(
        search: event.search,
        zona: event.zona,
        stand: event.stand,
        col: event.col,
        fil: event.fil,
        cantidad: event.cantidad,
        usuario: event.usuario,
        imagenes: event.imagenes,
      );
      final result = await insertarUbicacion.insertarUbiCall(ubicacion);
      result.fold(
        (failure) => emit(UbicacionError(failure.message)),
        (mensajeUbi) => emit(UbicacionSucces(mensajeUbi)),
      );
    });
  }
}
