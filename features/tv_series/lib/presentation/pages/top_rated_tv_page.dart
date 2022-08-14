import 'package:common/helper/analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/presentation/bloc/top_rated/top_rated_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

class TopRatedTvPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.microtask(() => AnalyticsHelper.sendOpenPageAnalytics("topRatedTvPage"));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => TopRatedBloc()..add(TopRatedFetchDataEvent()),
          child: BlocBuilder<TopRatedBloc, TopRatedState>(
            builder: (context, state) {
              if (state is TopRatedFetchSuccessState) {
                return _buildList(state.tvSeries);
              } else if (state is TopRatedFetchFailedState) {
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
