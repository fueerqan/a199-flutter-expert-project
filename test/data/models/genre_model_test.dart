import 'package:common/data/models/genre_model.dart';
import 'package:common/presentation/common/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tGenreModel = GenreModel(id: 12345, name: "Genre Name");
  final tGenreJson = {
    "id": 12345,
    "name": "Genre Name",
  };
  final tGenreEntity = Genre(id: 12345, name: "Genre Name");

  group('fromJson', () {
    test("should return a valid model from JSON", () {
      // arrange

      // act
      final result = GenreModel.fromJson(tGenreJson);

      // asssert
      expect(result, tGenreModel);
    });
  });

  group('toJson', () {
    test("should return a valid JSON map based on model", () {
      // arrange

      // act
      final result = tGenreModel.toJson();

      // asssert
      expect(result, tGenreJson);
    });
  });

  group('toEntity', () {
    test("should return a valid Entity based on GenreModel", () {
      // arrange

      // act
      final result = tGenreModel.toEntity();

      // asssert
      expect(result, tGenreEntity);
    });
  });
}
