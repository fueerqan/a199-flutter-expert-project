import 'package:common/helper/analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

class NowPlayingTvPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.microtask(() => AnalyticsHelper.sendOpenPageAnalytics("nowPlayingTvPage"));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (_) => NowPlayingBloc()..add(NowPlayingFetchDataEvent()),
          child: BlocBuilder<NowPlayingBloc, NowPlayingState>(
            builder: (context, state) {
              if (state is NowPlayingFetchSuccessState) {
                return _buildList(state.tvSeries);
              } else if (state is NowPlayingFetchFailedState) {
                return _buildError(state.message);
              } else {
                return _buildLoading();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String message) {
    return Center(
      key: const Key('error_message'),
      child: Text(message),
    );
  }

  Widget _buildList(List<TvSeries> data) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final movie = data[index];
        return TvCard(movie);
      },
      itemCount: data.length,
    );
  }
}
