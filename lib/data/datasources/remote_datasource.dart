import 'dart:convert';

import 'package:common/common/constants.dart';
import 'package:common/common/exception.dart';
import 'package:common/helper/network_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:http/io_client.dart';
import 'package:movies/data/models/movie_model.dart';
import 'package:movies/data/models/movie_response.dart';
import 'package:tv_series/data/models/tv_model.dart';
import 'package:tv_series/data/models/tv_response.dart';

abstract class RemoteDataSource {
  Future<Either<List<MovieModel>, List<TvModel>>> searchMovies(
    String query,
    String type,
  );
}

class RemoteDataSourceImpl extends RemoteDataSource {
  RemoteDataSourceImpl();

  static IOClient? client;

  @override
  Future<Either<List<MovieModel>, List<TvModel>>> searchMovies(
      String query, String type) async {
    String url = "$BASE_URL/search/";
    if (type.toLowerCase() == "movie") {
      url += "movie";
    } else {
      url += "tv";
    }

    client ??= await NetworkHelper.client;
    final response = await client!.get(Uri.parse('$url?$API_KEY&query=$query'));

    if (response.statusCode == 200 && type.toLowerCase() == "movie") {
      return Left(MovieResponse.fromJson(json.decode(response.body)).movieList);
    } else if (response.statusCode == 200) {
      return Right(TvResponse.fromJson(json.decode(response.body)).tvList);
    } else {
      throw ServerException();
    }
  }
}
