import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/resultados/data/datasource/stock_remote_datasource.dart';
import 'package:practicando_clean/features/resultados/domain/entities/stock_entity.dart';
import 'package:practicando_clean/features/resultados/domain/repository/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  final StockRemoteDatasource stockRemoteDatasource;

  StockRepositoryImpl({required this.stockRemoteDatasource});
  @override
  Future<Either<Failure, List<StockEntity>>> obtenerStockSistema({
    required String codProducto,
  }) async {
    try {
      final stockModel = await stockRemoteDatasource.obtenerApiStock(
        codProcuto: codProducto,
      );
      final stockParseadoEntity = stockModel
          .map((model) => model.toEntity())
          .toList();
      return Right(stockParseadoEntity);
    } catch (e) {
      return Left(ServerFailure('Error al obtener Stock del sistema Impl'));
    }
  }
}
