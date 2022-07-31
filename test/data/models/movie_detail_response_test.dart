import 'package:ditonton/data/models/movie/genre_model.dart';
import 'package:ditonton/data/models/movie/movie_detail_model.dart';
import 'package:ditonton/domain/entities/common/genre.dart';
import 'package:ditonton/domain/entities/movie/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tMovieDetailResponseComplete = MovieDetailResponse(
    adult: false,
    backdropPath: "some random path",
    budget: 10000,
    genres: [GenreModel(id: 12345, name: "Some Genre")],
    homepage: "homeapge",
    id: 67890,
    imdbId: "imdb id",
    originalLanguage: "en",
    originalTitle: "original title",
    overview: "overview",
    popularity: 10.0,
    posterPath: "some random path",
    releaseDate: "release date",
    revenue: 100000,
    runtime: 60,
    status: "airing",
    tagline: "tagline",
    title: "title",
    video: false,
    voteAverage: 10.0,
    voteCount: 20,
  );
  final tMovieDetailCompleteJson = {
    "adult": false,
    "backdrop_path": "some random path",
    "budget": 10000,
    "genres": [
      {"id": 12345, "name": "Some Genre"}
    ],
    "homepage": "homeapge",
    "id": 67890,
    "imdb_id": "imdb id",
    "original_language": "en",
    "original_title": "original title",
    "overview": "overview",
    "popularity": 10.0,
    "poster_path": "some random path",
    "release_date": "release date",
    "revenue": 100000,
    "runtime": 60,
    "status": "airing",
    "tagline": "tagline",
    "title": "title",
    "video": false,
    "vote_average": 10.0,
    "vote_count": 20,
  };
  final tMovieDetailCompleteEntity = MovieDetail(
    adult: false,
    backdropPath: "some random path",
    genres: [Genre(id: 12345, name: "Some Genre")],
    id: 67890,
    originalTitle: "original title",
    overview: "overview",
    posterPath: "some random path",
    releaseDate: "release date",
    runtime: 60,
    title: "title",
    voteAverage: 10.0,
    voteCount: 20,
  );

  final tMovieDetailResponseWithNull = MovieDetailResponse(
    adult: false,
    backdropPath: null,
    budget: 10000,
    genres: [GenreModel(id: 12345, name: "Some Genre")],
    homepage: "homeapge",
    id: 67890,
    imdbId: null,
    originalLanguage: "en",
    originalTitle: "original title",
    overview: "overview",
    popularity: 10.0,
    posterPath: "some random path",
    releaseDate: "release date",
    revenue: 100000,
    runtime: 60,
    status: "airing",
    tagline: "tagline",
    title: "title",
    video: false,
    voteAverage: 10.0,
    voteCount: 20,
  );
  final tMovieDetailWithNullJson = {
    "adult": false,
    "backdrop_path": null,
    "budget": 10000,
    "genres": [
      {"id": 12345, "name": "Some Genre"}
    ],
    "homepage": "homeapge",
    "id": 67890,
    "imdb_id": null,
    "original_language": "en",
    "original_title": "original title",
    "overview": "overview",
    "popularity": 10.0,
    "poster_path": "some random path",
    "release_date": "release date",
    "revenue": 100000,
    "runtime": 60,
    "status": "airing",
    "tagline": "tagline",
    "title": "title",
    "video": false,
    "vote_average": 10.0,
    "vote_count": 20,
  };
  final tMovieDetailWithNullEntity = MovieDetail(
    adult: false,
    backdropPath: null,
    genres: [Genre(id: 12345, name: "Some Genre")],
    id: 67890,
    originalTitle: "original title",
    overview: "overview",
    posterPath: "some random path",
    releaseDate: "release date",
    runtime: 60,
    title: "title",
    voteAverage: 10.0,
    voteCount: 20,
  );

  group("Complete Movie Detail Response", () {
    test("fromJson", () {
      // arrange

      // act
      final result = MovieDetailResponse.fromJson(tMovieDetailCompleteJson);

      // assert
      expect(result, tMovieDetailResponseComplete);
    });

    test("toJson", () {
      // arrange

      // act
      final result = tMovieDetailResponseComplete.toJson();

      // assert
      expect(result, tMovieDetailCompleteJson);
    });

    test("toEntity", () {
      // arrange

      // act
      final result = tMovieDetailResponseComplete.toEntity();

      // assert
      expect(result, tMovieDetailCompleteEntity);
    });
  });

  group("Incomplete Movie Detail Response", () {
    test("fromJson", () {
      // arrange

      // act
      final result = MovieDetailResponse.fromJson(tMovieDetailWithNullJson);

      // assert
      expect(result, tMovieDetailResponseWithNull);
    });

    test("toJson", () {
      // arrange

      // act
      final result = tMovieDetailResponseWithNull.toJson();

      // assert
      expect(result, tMovieDetailWithNullJson);
    });

    test("toEntity", () {
      // arrange

      // act
      final result = tMovieDetailResponseWithNull.toEntity();

      // assert
      expect(result, tMovieDetailWithNullEntity);
    });
  });
}
