import 'dart:convert';

import 'package:ditonton/data/models/movie/movie_detail_model.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/movie/movie_model.dart';
import 'package:ditonton/data/models/movie/movie_response.dart';
import 'package:ditonton/data/models/tv/tv_model.dart';
import 'package:ditonton/data/models/tv/tv_response.dart';
import 'package:http/http.dart' as http;

abstract class TvRemoteDataSource {
  Future<List<TvModel>> getNowPlayingTvSeries();
  Future<List<TvModel>> getPopularTvSeries();
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvModel>> getNowPlayingTvSeries() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getPopularTvSeries() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  // @override
  // Future<MovieDetailResponse> getMovieDetail(int id) async {
  //   final response =
  //       await client.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));

  //   if (response.statusCode == 200) {
  //     return MovieDetailResponse.fromJson(json.decode(response.body));
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<List<MovieModel>> getMovieRecommendations(int id) async {
  //   final response = await client
  //       .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));

  //   if (response.statusCode == 200) {
  //     return MovieResponse.fromJson(json.decode(response.body)).movieList;
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<List<MovieModel>> getTopRatedMovies() async {
  //   final response =
  //       await client.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));

  //   if (response.statusCode == 200) {
  //     return MovieResponse.fromJson(json.decode(response.body)).movieList;
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<List<MovieModel>> searchMovies(String query) async {
  //   final response = await client
  //       .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'));

  //   if (response.statusCode == 200) {
  //     return MovieResponse.fromJson(json.decode(response.body)).movieList;
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
