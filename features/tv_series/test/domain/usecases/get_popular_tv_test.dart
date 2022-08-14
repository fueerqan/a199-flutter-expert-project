import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_popular_tv.dart';

import 'get_now_playing_tv_test.mocks.dart';

void main() {
  late GetPopularTv usecase;
  late MockTvRepository mockRepository;

  setUp(() {
    mockRepository = MockTvRepository();
    usecase = GetPopularTv(mockRepository);
  });

  final tMovies = <TvSeries>[];

  group('GetPopularTvs Tests', () {
    group('execute', () {
      test(
          'should get list of tv series from the repository when execute function is called',
          () async {
        // arrange
        when(mockRepository.getPopularTvs())
            .thenAnswer((_) async => Right(tMovies));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tMovies));
      });
    });
  });
}
