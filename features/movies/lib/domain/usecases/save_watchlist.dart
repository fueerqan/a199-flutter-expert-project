import 'package:dartz/dartz.dart';
import 'package:common/common/failure.dart';
import 'package:movies/domain/movie/movie_detail.dart';
import 'package:movies/domain/repositories/movie_repository.dart';

class SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
