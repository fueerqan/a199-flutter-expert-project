import 'package:ditonton/data/models/tv/tv_model.dart';
import 'package:ditonton/data/models/tv/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Tv Response", () {
    test("data with null poster path should not included", () {
      // arrange
      final json = {
        "results": [
          {
            "poster_path": "poster path",
            "popularity": 10.0,
            "id": 12345,
            "backdrop_path": "backdrop path",
            "vote_average": 10.0,
            "overview": "overview",
            "first_air_date": "airing date",
            "origin_country": ["US"],
            "genre_ids": [123, 456],
            "original_language": "en",
            "vote_count": 1000,
            "name": "name",
            "original_name": "original name"
          },
          {
            "popularity": 10.0,
            "id": 67890,
            "backdrop_path": "backdrop path 2",
            "vote_average": 11.0,
            "overview": "overview 2",
            "first_air_date": "airing date 2",
            "origin_country": ["US"],
            "genre_ids": [123, 456],
            "original_language": "en",
            "vote_count": 1000,
            "name": "name 2",
            "original_name": "original name 2"
          },
        ]
      };

      final expectedModel = TvResponse(tvList: [
        TvModel(
          posterPath: "poster path",
          backdropPath: "backdrop path",
          popularity: 10.0,
          id: 12345,
          voteAverage: 10.0,
          overview: "overview",
          firstAirDate: "airing date",
          originCountry: ["US"],
          genreIds: [123, 456],
          originalLanguage: "en",
          voteCount: 1000,
          name: "name",
          originalName: "original name",
        ),
      ]);

      // act
      final result = TvResponse.fromJson(json);

      // assert
      expect(result.tvList.length, 1);
      expect(result
      , expectedModel);

      final tvData = result.tvList[0];
      expect(tvData.posterPath, "poster path");
      expect(tvData.popularity, 10.0);
      expect(tvData.id, 12345);
      expect(tvData.backdropPath, "backdrop path");
      expect(tvData.voteAverage, 10.0);
      expect(tvData.overview, "overview");
      expect(tvData.firstAirDate, "airing date");
      expect(tvData.originCountry.length, 1);
      expect(tvData.originCountry[0], "US");
      expect(tvData.genreIds.length, 2);
      expect(tvData.genreIds[0], 123);
      expect(tvData.genreIds[1], 456);
      expect(tvData.originalLanguage, "en");
      expect(tvData.voteCount, 1000);
      expect(tvData.name, "name");
      expect(tvData.originalName, "original name");
    });
  });

  group("Tv Model", () {
    test("toJson", () {
      // arrange
      final model = TvModel(
          popularity: 10.0,
          id: 12345,
          voteAverage: 10.0,
          overview: "overview",
          firstAirDate: "firstAirDate",
          originCountry: ["US"],
          genreIds: [123, 456],
          originalLanguage: "en",
          voteCount: 1000,
          name: "name",
          originalName: "originalName",
          posterPath: "poster path",
          backdropPath: "backdrop path");

      // act
      final result = model.toJson();

      // assert
      expect(result["poster_path"], model.posterPath);
      expect(result["popularity"], model.popularity);
      expect(result["id"], model.id);
      expect(result["backdrop_path"], model.backdropPath);
      expect(result["vote_average"], model.voteAverage);
      expect(result["overview"], model.overview);
      expect(result["first_air_date"], model.firstAirDate);
      expect(result["origin_country"], model.originCountry);
      expect(result["genre_ids"], model.genreIds);
      expect(result["original_language"], model.originalLanguage);
      expect(result["vote_count"], model.voteCount);
      expect(result["name"], model.name);
      expect(result["original_name"], model.originalName);
    });

    test("toEntity", () {
      // arrange
      final model = TvModel(
          popularity: 10.0,
          id: 12345,
          voteAverage: 10.0,
          overview: "overview",
          firstAirDate: "firstAirDate",
          originCountry: ["US"],
          genreIds: [123, 456],
          originalLanguage: "en",
          voteCount: 1000,
          name: "name",
          originalName: "originalName",
          posterPath: "poster path",
          backdropPath: "backdrop path");

      // act
      final result = model.toEntity();

      // assert
      expect(result.posterPath, model.posterPath);
      expect(result.popularity, model.popularity);
      expect(result.id, model.id);
      expect(result.backdropPath, model.backdropPath);
      expect(result.voteAverage, model.voteAverage);
      expect(result.overview, model.overview);
      expect(result.firstAirDate, model.firstAirDate);
      expect(result.originCountry, model.originCountry);
      expect(result.genreIds, model.genreIds);
      expect(result.originalLanguage, model.originalLanguage);
      expect(result.voteCount, model.voteCount);
      expect(result.title, model.name);
      expect(result.originalName, model.originalName);
    });
  });
}
