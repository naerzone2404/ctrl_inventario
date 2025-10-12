import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/resultados/domain/entities/stock_entity.dart';
import 'package:practicando_clean/features/resultados/domain/entities/stock_sistema_entity.dart';

abstract class StockRepository {
  Future<Either<Failure, List<StockEntity>>> obtenerStockFisico({
    required String codProducto,
  });
  Future<Either<Failure, List<StockSistemaEntity>>> obtenerStockSistema({
    required String codigo,
  });
}
