import 'package:common/common/failure.dart';
import 'package:common/data/datasource/movie_local_data_source.dart';
import 'package:common/data/models/movie_type.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/domain/movie/movie.dart';
import 'package:tv_series/domain/entities/tv.dart';

class WatchlistRepository {
  WatchlistRepository({required this.localDataSource});

  final MovieLocalDataSource localDataSource;

  Future<Either<Failure, List<Either<Movie, TvSeries>>>>
      getWatchlistMovies() async {
    final result = await localDataSource.getWatchlistMovies();
    final List<Movie> movieList = [];
    final List<TvSeries> tvList = [];

    result
        .map((data) => (data.movieType == MovieType.movie)
            ? movieList.add(Movie.watchlist(
                id: data.id,
                overview: data.overview,
                posterPath: data.posterPath,
                title: data.title,
              ))
            : tvList.add(TvSeries.watchlist(
                id: data.id,
                overview: data.overview,
                posterPath: data.posterPath,
                title: data.title,
              )))
        .toList();

    final List<Either<Movie, TvSeries>> resultList = [];
    movieList.map((data) => resultList.add(Left(data))).toList();
    tvList.map((data) => resultList.add(Right(data))).toList();

    return Right(resultList);
  }
}
