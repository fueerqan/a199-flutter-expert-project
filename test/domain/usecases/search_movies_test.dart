import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });

  final tMovies = <Movie>[];
  final tQuery = 'Spiderman';

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockMovieRepository.searchMovies(tQuery, "Movie"))
        .thenAnswer((_) async => Right(Left(tMovies)));
    // act
    final result = await usecase.execute(tQuery, "Movie");
    // assert
    List<Movie> expectedResult = [];

    final resultList = result.getOrElse(() => Left([]));
    resultList.fold((l) => expectedResult = l, (r) => null);

    expect(expectedResult, tMovies);
  });
}
