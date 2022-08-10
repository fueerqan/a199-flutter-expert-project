import 'package:equatable/equatable.dart';
import 'package:tv_series/data/models/tv_model.dart';

class TvResponse extends Equatable {
  TvResponse({required this.tvList});

  final List<TvModel> tvList;

  factory TvResponse.fromJson(Map<String, dynamic> json) => TvResponse(
        tvList: (json["results"] as List)
            .map((e) => TvModel.fromJson(e))
            .where((element) => element.posterPath != null)
            .toList(),
      );

  @override
  List<Object?> get props => [tvList];
}
