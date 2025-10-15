import 'package:dartz/dartz.dart';
import 'package:practicando_clean/features/core/errors/failure.dart';
import 'package:practicando_clean/features/resultados/data/datasource/stock_remote_datasource.dart';
import 'package:practicando_clean/features/resultados/domain/entities/stock_entity.dart';
import 'package:practicando_clean/features/resultados/domain/entities/stock_sistema_entity.dart';
import 'package:practicando_clean/features/resultados/domain/repository/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  final StockRemoteDatasource stockRemoteDatasource;

  // ignore: empty_constructor_bodies
  StockRepositoryImpl({required this.stockRemoteDatasource}) {}
  @override
  Future<Either<Failure, List<StockEntity>>> obtenerStockFisico({
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
    } on Failure catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error al obtener Stock del sistema Impl'));
    }
  }

  @override
  Future<Either<Failure, List<StockSistemaEntity>>> obtenerStockSistema({
    required String codigo,
  }) async {
    try {
      final stockSistemaModel = await stockRemoteDatasource.obtenerApiSistema(
        codigo: codigo,
      );
      final stockSistemaParseEntity = stockSistemaModel
          .map((fisico) => fisico.toEntity())
          .toList();
      return Right(stockSistemaParseEntity);
    } on Failure catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        ServerFailure('Error desconocido  del modelo a entidad Impl $e'),
      );
    }
  }
}
