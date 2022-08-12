import 'dart:io';

import 'package:common/common/exception.dart';
import 'package:common/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/data/datasources/remote_datasource.dart';
import 'package:movies/domain/movie/movie.dart';
import 'package:tv_series/domain/entities/tv.dart';

class SearchRepository {
  SearchRepository({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  Future<Either<Failure, Either<List<Movie>, List<TvSeries>>>> searchMovies(
      String query, String type) async {
    try {
      final result = await remoteDataSource.searchMovies(query, type);

      final List<Movie> movieList = [];
      final List<TvSeries> tvList = [];

      result.fold(
        (movie) => movieList.addAll(movie.map((e) => e.toEntity()).toList()),
        (tv) => tvList.addAll(tv.map((e) => e.toEntity()).toList()),
      );

      if (type.toLowerCase() == "movie") {
        return Right(Left(movieList));
      } else {
        return Right(Right(tvList));
      }
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
