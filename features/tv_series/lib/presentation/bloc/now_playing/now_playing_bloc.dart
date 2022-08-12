import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_now_playing_tv.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(NowPlayingInitial()) {
    on<NowPlayingFetchDataEvent>((event, emit) async {
      emit(NowPlayingLoadingState());

      final GetNowPlayingTv useCase = GetIt.instance();

      final result = await useCase.execute();
      result.fold(
        (l) => emit(
          NowPlayingFetchFailedState(message: l.message),
        ),
        (r) => emit(
          NowPlayingFetchSuccessState(tvSeries: r),
        ),
      );
    });
  }
}
