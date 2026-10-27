class BookModel {
  final int id;
  final String title;
  final String? key;
  final List<String> authors;
  final String? imageUrl;
  final int downloadCount;
  final List<String> languages;
  final List<String> subjects;
  final List<String> bookshelves;
  final bool? copyright;
  final double? rating;
  final int ratingsCount;
  final String? readUrl;
  final String? downloadUrl;
  final String? textUrl;

  BookModel({
    required this.id,
    required this.title,
    this.key,
    required this.authors,
    this.imageUrl,
    this.downloadCount = 0,
    this.languages = const [],
    this.subjects = const [],
    this.bookshelves = const [],
    this.copyright,
    this.rating,
    this.ratingsCount = 0,
    this.readUrl,
    this.downloadUrl,
    this.textUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final formats = json['formats'] as Map<String, dynamic>? ?? {};

    final image = formats['image/jpeg']?.toString();

    final authorsData = json['authors'] as List? ?? [];

    final languagesData = json['languages'] as List? ?? [];
    final subjectsData = json['subjects'] as List? ?? [];
    final bookshelvesData = json['bookshelves'] as List? ?? [];

final readUrl = formats['text/html']?.toString();

final downloadUrl =
    formats['application/epub+zip']?.toString();

final textUrl = formats.entries
    .where((entry) => entry.key.startsWith('text/plain'))
    .map((entry) => entry.value.toString())
    .firstOrNull;

    return BookModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title']?.toString() ?? 'Unknown Title',
      key: json['id']?.toString(),
      authors: authorsData
          .map((author) => author['name']?.toString() ?? '')
          .where((name) => name.isNotEmpty)
          .cast<String>()
          .toList(),
      imageUrl: image,
      downloadCount: (json['download_count'] as num?)?.toInt() ?? 0,
      languages: languagesData.map((e) => e.toString()).toList(),
      subjects: subjectsData.map((e) => e.toString()).toList(),
      bookshelves: bookshelvesData.map((e) => e.toString()).toList(),
      copyright: json['copyright'] as bool?,
      rating: null,
      ratingsCount: 0,
      readUrl: readUrl,
downloadUrl: downloadUrl,
textUrl: textUrl,
    );
  }

  String get authorName =>
      authors.isEmpty ? 'Unknown Author' : authors.join(', ');

  String? get coverUrl => imageUrl;

  int? get coverId => null;

  int? get firstPublishYear => null;

  int get editionCount => 0;

  bool get hasFullText => true;

  BookModel copyWith({double? rating, int? ratingsCount}) {
    return BookModel(
      id: id,
      title: title,
      key: key,
      authors: authors,
      imageUrl: imageUrl,
      downloadCount: downloadCount,
      languages: languages,
      subjects: subjects,
      bookshelves: bookshelves,
      copyright: copyright,
      rating: rating ?? this.rating,
      ratingsCount: ratingsCount ?? this.ratingsCount,
    );
  }
}
