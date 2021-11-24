import 'package:duration/duration.dart';

enum RecipeTag {
  food,
  drink,
}

class RecipeModel {
  final String id;
  final List<RecipeTag> type;
  final String name;
  final Duration duration;
  final List<String> ingredients;
  final List<String> preparation;
  final String imageURL;

  const RecipeModel({
    required this.id,
    required this.type,
    required this.name,
    required this.duration,
    required this.ingredients,
    required this.preparation,
    required this.imageURL,
  });

  String get getDurationString => prettyDuration(this.duration);

  RecipeModel.fromMap(Map<String, dynamic> data, String id)
      : this(
          id: id,
          type: List<RecipeTag>.from([data['type']]),
          name: data['name'],
          duration: Duration(minutes: data['duration']),
          ingredients: List<String>.from(data['ingredients']),
          preparation: List<String>.from(data['preparation']),
          imageURL: data['image'],
        );
}
