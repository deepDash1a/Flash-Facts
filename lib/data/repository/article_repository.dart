import 'package:news_app/data/model/article_model.dart';
import 'package:news_app/data/web_services/article_web_services.dart';

class ArticleRepository {
  final ArticleWebServices articleWebServices;

  ArticleRepository(this.articleWebServices);

  Future<List<Article>> getBusinessArticles() async {
    final article = await ArticleWebServices().getBusinessArticles();
    return article;
  }

  Future<List<Article>> getScienceArticles() async {
    final article = await ArticleWebServices().getScienceArticles();
    return article;
  }

  Future<List<Article>> getSportArticles() async {
    final article = await ArticleWebServices().getSportArticles();
    return article;
  }

  Future<List<Article>> getSearchedArticles(value) async {
    final searchedArticle =
        await ArticleWebServices().getSearchedArticles(value);
    return searchedArticle;
  }
}
