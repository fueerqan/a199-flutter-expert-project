// Mocks generated by Mockito 5.0.8 from annotations
// in ditonton/test/data/repositories/movie_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:ditonton/data/datasources/movie_remote_data_source.dart' as _i4;
import 'package:ditonton/data/models/movie_model.dart' as _i6;
import 'package:ditonton/domain/entities/genre.dart' as _i1;
import 'package:ditonton/domain/entities/movie_detail.dart' as _i3;
import 'package:mockito/mockito.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeMovieDetail<T extends _i1.Genre> extends _i2.Fake
    implements _i3.MovieDetail<T> {}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i2.Mock
    implements _i4.MovieRemoteDataSource {
  @override
  _i5.Future<List<_i6.MovieModel>> getNowPlayingMovies() => (super.noSuchMethod(
          Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<List<_i6.MovieModel>>.value(<_i6.MovieModel>[]))
      as _i5.Future<List<_i6.MovieModel>>);
  @override
  _i5.Future<List<_i6.MovieModel>> getPopularMovies() => (super.noSuchMethod(
          Invocation.method(#getPopularMovies, []),
          returnValue: Future<List<_i6.MovieModel>>.value(<_i6.MovieModel>[]))
      as _i5.Future<List<_i6.MovieModel>>);
  @override
  _i5.Future<List<_i6.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
          Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<List<_i6.MovieModel>>.value(<_i6.MovieModel>[]))
      as _i5.Future<List<_i6.MovieModel>>);
  @override
  _i5.Future<_i3.MovieDetail<_i1.Genre>> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue: Future<_i3.MovieDetail<_i1.Genre>>.value(
                  _FakeMovieDetail<_i1.Genre>()))
          as _i5.Future<_i3.MovieDetail<_i1.Genre>>);
  @override
  _i5.Future<List<_i6.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  Future<List<_i6.MovieModel>>.value(<_i6.MovieModel>[]))
          as _i5.Future<List<_i6.MovieModel>>);
}
