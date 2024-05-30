// TODO: Delete this once you have your own entity
class ExampleEntity {
  final String id;
  final String name;

  ExampleEntity({
    required this.id,
    required this.name,
  });

  factory ExampleEntity.fromJson(Map<String, dynamic> json) {
    return ExampleEntity(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  static List<ExampleEntity> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => ExampleEntity.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
