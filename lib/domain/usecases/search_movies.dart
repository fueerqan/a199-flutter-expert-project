import 'package:dartz/dartz.dart';
import 'package:common/common/failure.dart';
import 'package:ditonton/domain/repositories/search_repository.dart';
import 'package:movies/domain/movie/movie.dart';
import 'package:tv_series/domain/entities/tv.dart';

class SearchMovies {
  final SearchRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, Either<List<Movie>, List<TvSeries>>>> execute(
    String query,
    String type,
  ) async {
    return repository.searchMovies(query, type);
  }
}
