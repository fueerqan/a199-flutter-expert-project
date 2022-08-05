import 'package:dartz/dartz.dart';
import 'package:common/common/failure.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, Either<List<Movie>, List<TvSeries>>>> execute(
    String query,
    String type,
  ) {
    return repository.searchMovies(query, type);
  }
}
