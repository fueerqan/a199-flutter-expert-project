import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';
import 'package:tv_series/domain/usecases/get_now_playing_tv.dart';

import 'get_now_playing_tv_test.mocks.dart';

@GenerateMocks([TvRepository])
void main() {
  late GetNowPlayingTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetNowPlayingTv(mockTvRepository);
  });

  final tTvs = <TvSeries>[];

  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvRepository.getNowPlayingTVs())
        .thenAnswer((_) async => Right(tTvs));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvs));
  });
}
