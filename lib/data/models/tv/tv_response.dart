import 'package:ditonton/data/models/tv/tv_model.dart';
import 'package:equatable/equatable.dart';

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
