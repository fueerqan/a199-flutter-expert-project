import 'package:common/data/models/movie_table.dart';
import 'package:common/data/models/movie_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/data/models/movie_model.dart';
import 'package:movies/domain/movie/movie.dart';

void main() {
  final tMovieModel = MovieModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovieTableMovie = MovieTable(
      id: 123,
      title: "title",
      posterPath: "posterPath",
      overview: "overview",
      movieType: MovieType.movie);

  test('should be a subclass of Movie entity', () async {
    final result = tMovieModel.toEntity();
    expect(result, tMovie);
  });

  test("movie from movie table", () {
    // arrange

    // act
    final result = Movie.watchlist(
      id: tMovieTableMovie.id,
      overview: tMovieTableMovie.overview,
      posterPath: tMovieTableMovie.posterPath,
      title: tMovieTableMovie.title,
    );

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
}
