import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:common/common/failure.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvWatchlistMovies {
  final TvRepository _repository;

  GetTvWatchlistMovies(this._repository);

  Future<Either<Failure, List<TvSeries>>> execute() async {
    // return _repository.getWatchlistMovies();
    return Left(DatabaseFailure(""));
  }
}
