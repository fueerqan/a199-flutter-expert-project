import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedBloc() : super(TopRatedInitial()) {
    on<TopRatedFetchDataEvent>((event, emit) async {
      emit(TopRatedLoadingState());

      final GetTopRatedTv usecase = GetIt.instance();

      final result = await usecase.execute();

      result.fold(
        (l) => emit(
          TopRatedFetchFailedState(message: l.message),
        ),
        (r) => emit(
          TopRatedFetchSuccessState(tvSeries: r),
        ),
      );
    });
  }
}
