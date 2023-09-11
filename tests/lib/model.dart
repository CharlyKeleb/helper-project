class JokeModel {
  bool error;
  String category;
  String type;
  String? setup;
  String? delivery;
  String? joke;

  JokeModel({
    required this.error,
    required this.category,
    required this.type,
    required this.setup,
    required this.delivery,
    required this.joke,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      error: json['error'] as bool,
      category: json['category'] as String,
      type: json['type'] as String,
      setup: json['setup'] as String?,
      delivery: json['delivery'] as String?,
      joke: json['joke'] as String?,
    );
  }
}
