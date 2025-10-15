import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/resultados/domain/usecase/get_stock_usecase.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_sistema/stock_sistema_event.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_sistema/stock_sistema_state.dart';

class StockSistemaBloc extends Bloc<StockSistemaEvent, StockSistemaState> {
  final GetStockUsecase getStockSistemaUsecase;

  StockSistemaBloc({required this.getStockSistemaUsecase})
    : super(StockSistemaInitial()) {
    on<ObtenerStockSistema>((event, emit) async {
      emit(StockSistemaLoading());
      final result = await getStockSistemaUsecase.callSistema(
        codigo: event.codigo,
      );
      result.fold(
        (failure) => emit(StockSistemaError(failure.message)),
        (stockSys) => emit(StockSistemaCargado(stockSys)),
      );
    });
  }
}
