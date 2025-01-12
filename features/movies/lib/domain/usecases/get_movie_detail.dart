import 'package:common/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/domain/movie/movie_detail.dart';
import 'package:movies/domain/repositories/movie_repository.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
