import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/resultados/domain/entities/stock_entity.dart';

abstract class StockRepository {
  Future<Either<Failure, List<StockEntity>>> obtenerStockSistema({
    required String codProducto,
  });
}
