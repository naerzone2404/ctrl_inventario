import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicando_clean/features/resultados/domain/usecase/get_stock_usecase.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_event.dart';
import 'package:practicando_clean/features/resultados/presentation/bloc/stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStockUsecase getStockUsecase;

  StockBloc({required this.getStockUsecase}) : super(StateStockInitial()) {
    on<EventoStockObtenido>((event, emit) async {
      emit(StateStockLoading());

      final resultStock = await getStockUsecase(codProducto: event.codigo);

      resultStock.fold(
        (failure) => emit(StateStockError(failure.message)),
        (stockObtenido) => emit(StateStockCargado(stockObtenido)),
      );
    });
  }
}
