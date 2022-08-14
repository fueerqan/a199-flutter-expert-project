import 'package:common/presentation/common/genre.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';

import 'get_now_playing_tv_test.mocks.dart';

void main() {
  late GetTvDetail usecase;
  late MockTvRepository mockTvRepository;

  final testTvDetail = TvDetail(
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    originalName: "originalName",
    overview: 'overview',
    posterPath: 'posterPath',
    firstAirDate: 'releaseDate',
    name: 'title',
    voteAverage: 1,
    voteCount: 1,
    createdBy: [],
    episodeRunTime: [],
    languages: [],
    productionCompanies: [],
    seasons: [],
  );

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvDetail(mockTvRepository);
  });

  const tId = 1;

  test('should get movie detail from the repository', () async {
    // arrange
    when(mockTvRepository.getTvDetail(tId))
        .thenAnswer((_) async => Right(testTvDetail));
    // act
    final result = await usecase.execute(tId);
    // assert
    TvDetail expectedResult = result.getOrElse(() => throw Exception(""));

    expect(expectedResult, testTvDetail);
  });
}
