import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_popular_tv.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc() : super(PopularInitial()) {
    on<PopularEvent>((event, emit) async {
      emit(PopularLoadingState());

      final GetPopularTv usecase = GetIt.instance();

      final result = await usecase.execute();

      result.fold(
        (l) => emit(
          PopularFetchFailedState(message: l.message),
        ),
        (r) => emit(
          PopularFetchSuccessState(tvSeries: r),
        ),
      );
    });
  }
}
