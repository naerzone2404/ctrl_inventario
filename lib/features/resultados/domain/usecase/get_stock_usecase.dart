import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/resultados/domain/entities/stock_entity.dart';
import 'package:practicando_clean/features/resultados/domain/repository/stock_repository.dart';

class GetStockUsecase {
  final StockRepository repository;
  GetStockUsecase(this.repository);

  Future<Either<Failure, List<StockEntity>>> call({
    required String codProducto,
  }) async {
    return await repository.obtenerStockSistema(codProducto: codProducto);
  }
}
