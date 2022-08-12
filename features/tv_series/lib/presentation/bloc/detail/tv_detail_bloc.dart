import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';
import 'package:tv_series/domain/usecases/get_tv_watchlist_status.dart';
import 'package:tv_series/domain/usecases/remove_tv_watchlist.dart';
import 'package:tv_series/domain/usecases/save_tv_watchlist.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  TvDetailBloc() : super(TvDetailInitial()) {
    on<TvDetailFetchDataEvent>((event, emit) async {
      emit(TvDetailLoadingState());

      final GetTvDetail detailUsecase = GetIt.instance();
      final GetTvRecommendations recommendationUsecase = GetIt.instance();
      final GetTvWatchListStatus watchListStatus = GetIt.instance();

      final detailResult = await detailUsecase.execute(event.tvId);
      final recommendationResult =
          await recommendationUsecase.execute(event.tvId);
      final isWatchlisted = await watchListStatus.execute(event.tvId);

      detailResult.fold((l) {
        emit(
          TvDetailFetchFailedState(message: l.message),
        );
      }, (tvDetail) {
        recommendationResult.fold(
          (l) {
            /// no op, because detail already success,
            /// so display detail only without recommendation
          },
          (recommendations) => emit(
            TvDetailFetchSuccessState(
              detail: tvDetail,
              recommendations: recommendations,
              isWatchlisted: isWatchlisted,
            ),
          ),
        );
      });
    });

    on<TvDetailAddToWatchlistEvent>((event, emit) async {
      final SaveTvWatchlist usecase = GetIt.instance();
      final GetTvWatchListStatus watchListStatus = GetIt.instance();

      final result = await usecase.execute(event.detail);
      final isWatchlisted = await watchListStatus.execute(event.detail.id ?? 0);

      result.fold(
        (l) => emit(
          TvDetailAddWatchListFailedState(message: l.message),
        ),
        (r) {
          emit(
            TvDetailFetchSuccessState(
              detail: event.detail,
              recommendations: event.recommendations,
              isWatchlisted: isWatchlisted,
              message: r,
            ),
          );
        },
      );
    });

    on<TvDetailRemoveWatchlistEvent>((event, emit) async {
      final RemoveTvWatchlist usecase = GetIt.instance();
      final GetTvWatchListStatus watchListStatus = GetIt.instance();

      final result = await usecase.execute(event.detail);
      final isWatchlisted = await watchListStatus.execute(event.detail.id ?? 0);

      result.fold(
        (l) => emit(
          TvDetailAddWatchListFailedState(message: l.message),
        ),
        (r) {
          emit(
            TvDetailFetchSuccessState(
              detail: event.detail,
              recommendations: event.recommendations,
              isWatchlisted: isWatchlisted,
              message: r,
            ),
          );
        },
      );
    });
  }
}
