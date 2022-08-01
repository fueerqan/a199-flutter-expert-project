import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_search_notifier_test.mocks.dart';

@GenerateMocks([SearchMovies])
void main() {
  late MovieSearchNotifier provider;
  late MockSearchMovies mockSearchMovies;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockSearchMovies = MockSearchMovies();
    provider = MovieSearchNotifier(searchMovies: mockSearchMovies)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tMovieModel = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tMovieList = <Movie>[tMovieModel];
  final tQuery = 'spiderman';

  final tTvModel = TvSeries(
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalName: "Game of Throne",
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    firstAirDate: '2002-05-01',
    title: 'Spider-Man',
    voteAverage: 7.2,
    voteCount: 13507,
    originalLanguage: 'en',
    originCountry: ["US"],
  );
  final tTvList = <TvSeries>[tTvModel];
  final tTvQuery = 'Game of';

  group('search movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchMovies.execute(tQuery, "Movie"))
          .thenAnswer((_) async => Right(Left(tMovieList)));
      // act
      provider.fetchMovieSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchMovies.execute(tQuery, "Movie"))
          .thenAnswer((_) async => Right(Left(tMovieList)));
      // act
      await provider.fetchMovieSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, tMovieList);
      expect(provider.searchTvResult, []);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchMovies.execute(tQuery, "Movie"))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchMovieSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('search tv series', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      provider.changeSearchType("Tv Series");
      when(mockSearchMovies.execute(tTvQuery, "Tv Series"))
          .thenAnswer((_) async => Right(Right(tTvList)));
      // act
      provider.fetchMovieSearch(tTvQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      provider.changeSearchType("Tv Series");
      when(mockSearchMovies.execute(tTvQuery, "Tv Series"))
          .thenAnswer((_) async => Right(Right(tTvList)));
      // act
      await provider.fetchMovieSearch(tTvQuery);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, []);
      expect(provider.searchTvResult, tTvList);
      expect(listenerCallCount, 3);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      provider.changeSearchType("Tv Series");
      when(mockSearchMovies.execute(tTvQuery, "Tv Series"))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchMovieSearch(tTvQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 3);
    });
  });

  group("Change Search Type", () {
    test("when change search, should change the dropdown value", () {
      // arrange

      // act
      provider.changeSearchType("Tv Series");

      // assert
      expect(provider.dropdownValue, "Tv Series");
    });

    test(
        "when change search with null value, should change the dropdown value to default",
        () {
      // arrange

      // act
      provider.changeSearchType(null);

      // assert
      expect(provider.dropdownValue, SearchPage.dropdownOptions[0]);
    });
  });
}
