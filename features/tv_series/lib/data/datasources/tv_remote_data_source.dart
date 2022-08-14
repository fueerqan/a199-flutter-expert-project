import 'dart:convert';

import 'package:common/common/constants.dart';
import 'package:common/common/exception.dart';
import 'package:common/helper/network_helper.dart';
import 'package:http/io_client.dart';
import 'package:tv_series/data/models/tv_detail_model.dart';
import 'package:tv_series/data/models/tv_model.dart';
import 'package:tv_series/data/models/tv_response.dart';

abstract class TvRemoteDataSource {
  Future<List<TvModel>> getNowPlayingTvSeries();

  Future<List<TvModel>> getPopularTvSeries();

  Future<TvDetailResponse> getTvDetail(int id);

  Future<List<TvModel>> getTvRecommendations(int id);

  Future<List<TvModel>> getTopRatedTvSeries();
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  static IOClient? client;

  TvRemoteDataSourceImpl();

  @override
  Future<List<TvModel>> getNowPlayingTvSeries() async {
    client ??= await NetworkHelper.client;

    final response =
        await client!.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getPopularTvSeries() async {
    client ??= await NetworkHelper.client;

    final response =
        await client!.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTvSeries() async {
    client ??= await NetworkHelper.client;

    final response =
        await client!.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailResponse> getTvDetail(int id) async {
    client ??= await NetworkHelper.client;

    final response = await client!.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTvRecommendations(int id) async {
    client ??= await NetworkHelper.client;

    final response = await client!
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }
}
