import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/movie_type.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/movie/movie_detail.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
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

  group("From Entity", () {
    test("MovieDetail", () {
      // arrange
      final movieDetail = MovieDetail(
        adult: false,
        backdropPath: null,
        genres: [],
        id: 123,
        originalTitle: "",
        overview: "overview",
        posterPath: "posterPath",
        releaseDate: "releaseDate",
        runtime: 60,
        title: "title",
        voteAverage: 10.0,
        voteCount: 1000,
      );

      // act
      final result = MovieTable.fromEntity(movie: movieDetail);

      // assert
      expect(result, tMovieTableMovie);
    });

    test("TvDetail", () {
      // arrange
      final tvDetail = TvDetail(
        createdBy: [],
        episodeRunTime: [],
        genres: [],
        languages: [],
        productionCompanies: [],
        seasons: [],
        overview: "overview",
        posterPath: "posterPath",
        name: "title",
        id: 123,
      );

      // act
      final result = MovieTable.fromEntity(tv: tvDetail);

      // assert
      expect(result, tMovieTableTv);
    });
  });

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

  group("toEntity", () {
    test("movie", () {
      // arrange

      // act
      final result = tMovieTableMovie.toEntity();

      // assert
      final movieEntity = Movie(
        adult: null,
        backdropPath: null,
        genreIds: null,
        id: 123,
        originalTitle: null,
        overview: "overview",
        popularity: null,
        posterPath: "posterPath",
        releaseDate: null,
        title: "title",
        video: null,
        voteAverage: null,
        voteCount: null,
      );
      expect(result, movieEntity);
    });
    test("tv", () {
      // arrange

      // act
      final result = tMovieTableTv.toTvEntity();

      // assert
      final tvEntity = TvSeries(
        popularity: null,
        id: 123,
        voteAverage: null,
        overview: "overview",
        firstAirDate: null,
        originCountry: null,
        genreIds: null,
        originalLanguage: null,
        voteCount: null,
        title: "title",
        posterPath: "posterPath",
        originalName: null,
      );
      expect(result, tvEntity);
    });
  });
}
