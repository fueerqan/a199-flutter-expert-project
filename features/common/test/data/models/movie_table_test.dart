import 'package:common/data/models/movie_table.dart';
import 'package:common/data/models/movie_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tMovieTableMovie = MovieTable(
      id: 123,
      title: "title",
      posterPath: "posterPath",
      overview: "overview",
      movieType: MovieType.movie);
  final tMovieTableTv = MovieTable(
      id: 123,
      title: "title",
      posterPath: "posterPath",
      overview: "overview",
      movieType: MovieType.tv);

  final tMovieJson = {
    "id": 123,
    "title": "title",
    "posterPath": "posterPath",
    "overview": "overview",
    "type": "movie"
  };
  final tTvJson = {
    "id": 123,
    "title": "title",
    "posterPath": "posterPath",
    "overview": "overview",
    "type": "tv"
  };

  group("fromMap", () {
    test("movie", () {
      // arrange

      // act
      final result = MovieTable.fromMap(tMovieJson);

      // assert
      expect(result, tMovieTableMovie);
    });
    test("tv", () {
      // arrange

      // act
      final result = MovieTable.fromMap(tTvJson);

      // assert
      expect(result, tMovieTableTv);
    });
  });

  group("toJson", () {
    test("movie", () {
      // arrange

      // act
      final result = tMovieTableMovie.toJson();

      // assert
      expect(result, tMovieJson);
    });
    test("tv", () {
      // arrange

      // act
      final result = MovieTable.fromMap(tTvJson);

      // assert
      expect(result, tMovieTableTv);
    });
  });

  // group("toEntity", () {

  //   test("tv", () {
  //     // arrange
  //
  //     // act
  //     final result = TvSeries.watchlist(
  //       id: tMovieTableTv.id,
  //       overview: tMovieTableTv.overview,
  //       posterPath: tMovieTableTv.posterPath,
  //       title: tMovieTableTv.title,
  //     );
  //
  //     // assert
  //     final tvEntity = TvSeries(
  //       popularity: null,
  //       id: 123,
  //       voteAverage: null,
  //       overview: "overview",
  //       firstAirDate: null,
  //       originCountry: null,
  //       genreIds: null,
  //       originalLanguage: null,
  //       voteCount: null,
  //       title: "title",
  //       posterPath: "posterPath",
  //       originalName: null,
  //     );
  //     expect(result, tvEntity);
  //   });
  // });
}
