import 'dart:convert';

import 'package:common/common/constants.dart';
import 'package:common/common/exception.dart';
import 'package:common/helper/network_helper.dart';
import 'package:http/io_client.dart';
import 'package:movies/data/models/movie_detail_model.dart';
import 'package:movies/data/models/movie_model.dart';
import 'package:movies/data/models/movie_response.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailResponse> getMovieDetail(int id);

  Future<List<MovieModel>> getMovieRecommendations(int id);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  static IOClient? client;

  MovieRemoteDataSourceImpl();

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    client ??= await NetworkHelper.client;

    final response =
        await client!.get(Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    client ??= await NetworkHelper.client;

    final response =
        await client!.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    client ??= await NetworkHelper.client;

    final response = await client!
        .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    client ??= await NetworkHelper.client;

    final response =
        await client!.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    client ??= await NetworkHelper.client;

    final response =
        await client!.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }
}
