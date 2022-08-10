import 'package:dartz/dartz.dart';
import 'package:common/common/failure.dart';
import 'package:movies/domain/movie/movie_detail.dart';
import 'package:movies/domain/repositories/movie_repository.dart';

class RemoveWatchlist {
  final MovieRepository repository;

  RemoveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
