import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String? id;
  final String? name;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    required this.id,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['source']['id'],
      name: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
