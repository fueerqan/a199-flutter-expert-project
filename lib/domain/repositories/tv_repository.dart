import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTVs();
  Future<Either<Failure, List<TvSeries>>> getPopularTvs();
  Future<Either<Failure, TvDetail>> getTvDetail(int id);
  Future<Either<Failure, String>> saveWatchlist(TvDetail detail);
  Future<Either<Failure, String>> removeWatchlist(TvDetail detail);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, List<TvSeries>>> getWatchlistMovies();
  // Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  // Future<Either<Failure, List<Movie>>> getMovieRecommendations(int id);
  // Future<Either<Failure, List<Movie>>> searchMovies(String query);
  // Future<Either<Failure, String>> saveWatchlist(MovieDetail movie);
  // Future<Either<Failure, String>> removeWatchlist(MovieDetail movie);
  // Future<bool> isAddedToWatchlist(int id);
  // Future<Either<Failure, List<Movie>>> getWatchlistMovies();
}
