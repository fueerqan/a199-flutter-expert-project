// Mocks generated by Mockito 5.1.0 from annotations
// in ditonton/test/data/repositories/tv_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:ditonton/data/datasources/tv/tv_remote_data_source.dart' as _i3;
import 'package:ditonton/data/models/tv/tv_detail_model.dart' as _i2;
import 'package:ditonton/data/models/tv/tv_model.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTvDetailResponse_0 extends _i1.Fake implements _i2.TvDetailResponse {
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i3.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.TvModel>> getNowPlayingTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingTvSeries, []),
              returnValue: Future<List<_i5.TvModel>>.value(<_i5.TvModel>[]))
          as _i4.Future<List<_i5.TvModel>>);
  @override
  _i4.Future<List<_i5.TvModel>> getPopularTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTvSeries, []),
              returnValue: Future<List<_i5.TvModel>>.value(<_i5.TvModel>[]))
          as _i4.Future<List<_i5.TvModel>>);
  @override
  _i4.Future<_i2.TvDetailResponse> getTvDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvDetail, [id]),
              returnValue:
                  Future<_i2.TvDetailResponse>.value(_FakeTvDetailResponse_0()))
          as _i4.Future<_i2.TvDetailResponse>);
  @override
  _i4.Future<List<_i5.TvModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue: Future<List<_i5.TvModel>>.value(<_i5.TvModel>[]))
          as _i4.Future<List<_i5.TvModel>>);
}
