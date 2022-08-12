import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';
import 'package:movies/domain/movie/movie.dart';
import 'package:common/common/failure.dart';
import 'package:tv_series/domain/entities/tv.dart';

class GetWatchlistMovies {
  final WatchlistRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Either<Movie, TvSeries>>>> execute() async {
    return _repository.getWatchlistMovies();
  }
}
