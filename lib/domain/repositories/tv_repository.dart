import 'package:common/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTVs();
  Future<Either<Failure, List<TvSeries>>> getPopularTvs();
  Future<Either<Failure, TvDetail>> getTvDetail(int id);
  Future<Either<Failure, String>> saveWatchlist(TvDetail detail);
  Future<Either<Failure, String>> removeWatchlist(TvDetail detail);
  Future<bool> isAddedToWatchlist(int id);
  // Future<Either<Failure, List<TvSeries>>> getWatchlistMovies();
  Future<Either<Failure, List<TvSeries>>> getTvRecommendations(int id);
  Future<Either<Failure, List<TvSeries>>> getTopRatedTvs();
}
