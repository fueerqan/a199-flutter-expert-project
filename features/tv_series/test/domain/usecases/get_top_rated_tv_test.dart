import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv.dart';

import 'get_now_playing_tv_test.mocks.dart';

void main() {
  late GetTopRatedTv usecase;
  late MockTvRepository mockRepository;

  setUp(() {
    mockRepository = MockTvRepository();
    usecase = GetTopRatedTv(mockRepository);
  });

  final tMovies = <TvSeries>[];

  test('should get list of movies from repository', () async {
    // arrange
    when(mockRepository.getTopRatedTvs())
        .thenAnswer((_) async => Right(tMovies));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tMovies));
  });
}
