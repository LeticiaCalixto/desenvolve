class HealthCategory {
  final String id;
  final String name;
  final String description;
  final String iconName;
  final String color;
  final int articleCount;

  HealthCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.iconName,
    required this.color,
    required this.articleCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconName': iconName,
      'color': color,
      'articleCount': articleCount,
    };
  }

  factory HealthCategory.fromMap(Map<String, dynamic> map) {
    return HealthCategory(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      iconName: map['iconName'],
      color: map['color'],
      articleCount: map['articleCount'],
    );
  }
}
