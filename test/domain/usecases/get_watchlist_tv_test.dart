import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/get_tv_watchlist_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvWatchlistMovies usecase;
  late MockTvRepository mockRepository;

  setUp(() {
    mockRepository = MockTvRepository();
    usecase = GetTvWatchlistMovies(mockRepository);
  });

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockRepository.getWatchlistMovies())
        .thenAnswer((_) async => Right([testWatchlistTv]));
    // act
    final result = await usecase.execute();
    // assert
    final resultList = result.getOrElse(() => []);
    expect(resultList, [testWatchlistTv]);
  });
}
