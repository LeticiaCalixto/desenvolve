class HealthArticle {
  final String id;
  final String title;
  final String summary;
  final String content;
  final String category;
  final String ageGroup;
  final String imageUrl;
  final DateTime publishDate;
  final int readTime; // em minutos
  final List<String> tags;
  final String author;
  final bool isFavorite;

  HealthArticle({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    required this.ageGroup,
    required this.imageUrl,
    required this.publishDate,
    required this.readTime,
    required this.tags,
    required this.author,
    this.isFavorite = false,
  });

  HealthArticle copyWith({
    String? id,
    String? title,
    String? summary,
    String? content,
    String? category,
    String? ageGroup,
    String? imageUrl,
    DateTime? publishDate,
    int? readTime,
    List<String>? tags,
    String? author,
    bool? isFavorite,
  }) {
    return HealthArticle(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      content: content ?? this.content,
      category: category ?? this.category,
      ageGroup: ageGroup ?? this.ageGroup,
      imageUrl: imageUrl ?? this.imageUrl,
      publishDate: publishDate ?? this.publishDate,
      readTime: readTime ?? this.readTime,
      tags: tags ?? this.tags,
      author: author ?? this.author,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'content': content,
      'category': category,
      'ageGroup': ageGroup,
      'imageUrl': imageUrl,
      'publishDate': publishDate.toIso8601String(),
      'readTime': readTime,
      'tags': tags,
      'author': author,
      'isFavorite': isFavorite,
    };
  }

  factory HealthArticle.fromMap(Map<String, dynamic> map) {
    return HealthArticle(
      id: map['id'],
      title: map['title'],
      summary: map['summary'],
      content: map['content'],
      category: map['category'],
      ageGroup: map['ageGroup'],
      imageUrl: map['imageUrl'],
      publishDate: DateTime.parse(map['publishDate']),
      readTime: map['readTime'],
      tags: List<String>.from(map['tags']),
      author: map['author'],
      isFavorite: map['isFavorite'] ?? false,
    );
  }
}
