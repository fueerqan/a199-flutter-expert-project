import 'package:dartz/dartz.dart';
import 'package:common/common/failure.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetTvWatchlistMovies {
  final TvRepository _repository;

  GetTvWatchlistMovies(this._repository);

  Future<Either<Failure, List<TvSeries>>> execute() async {
    return _repository.getWatchlistMovies();
  }
}
