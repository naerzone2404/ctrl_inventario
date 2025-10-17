import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/nueva_ubicacion/domain/usecase/coordenadas_usecase.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/stand/stand_event.dart';
import 'package:practicando_clean/features/nueva_ubicacion/presentation/bloc/stand/stand_state.dart';

class StandBloc extends Bloc<StandEvent, StandState> {
  final CoordenadasUsecase coordenadasUsecase;

  StandBloc({required this.coordenadasUsecase}) : super(StandInitial()) {
    on<ObtenerStands>((event, emit) async {
      emit(StandLoading());
      final result = await coordenadasUsecase.callStand();
      result.fold(
        (failure) => StandError(failure.message),
        (stand) => emit(StandObtenido(stand)),
      );
    });
  }
}
