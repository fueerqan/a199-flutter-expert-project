import 'package:dartz/dartz.dart';
import 'package:common/common/failure.dart';
import 'package:movies/domain/movie/movie.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:tv_series/domain/entities/tv.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, Either<List<Movie>, List<TvSeries>>>> execute(
    String query,
    String type,
  ) async {
    // return repository.searchMovies(query, type);
    return Left(DatabaseFailure(""));
  }
}
