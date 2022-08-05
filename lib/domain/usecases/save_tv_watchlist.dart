import 'package:dartz/dartz.dart';
import 'package:common/common/failure.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class SaveTvWatchlist {
  final TvRepository repository;

  SaveTvWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvDetail detail) {
    return repository.saveWatchlist(detail);
  }
}
