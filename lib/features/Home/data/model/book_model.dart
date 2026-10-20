class BookModel {
  final String title;
  final String? key;
  final List<String> authors;
  final int? coverId;
  final int? firstPublishYear;
  final int editionCount;
  final List<String> languages;
  final bool hasFullText;

  BookModel({
    required this.title,
    this.key,
    required this.authors,
    this.coverId,
    this.firstPublishYear,
    required this.editionCount,
    required this.languages,
    required this.hasFullText,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] ?? 'Unknown Title',
      key: json['key'],
      authors: List<String>.from(json['author_name'] ?? []),
      coverId: json['cover_i'],
      firstPublishYear: json['first_publish_year'],
      editionCount: json['edition_count'] ?? 0,
      languages: List<String>.from(json['language'] ?? []),
      hasFullText: json['has_fulltext'] ?? false,
    );
  }

  String get authorName {
    if (authors.isEmpty) {
      return 'Unknown Author';
    }
    return authors.join(', ');
  }

  String? get coverUrl {
    if (coverId == null) {
      return null;
    }
    return 'https://covers.openlibrary.org/b/id/$coverId-M.jpg';
  }
}