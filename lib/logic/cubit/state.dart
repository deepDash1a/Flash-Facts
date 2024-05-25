import 'package:news_app/data/model/article_model.dart';

abstract class ArticleAppStates {}

class InitializeArticleAppState extends ArticleAppStates {}

class LoadingBusinessArticlesAppState extends ArticleAppStates {}

class SuccessBusinessArticlesAppState extends ArticleAppStates {
  final List<Article> article;

  SuccessBusinessArticlesAppState(this.article);
}

class ErrorBusinessArticlesAppState extends ArticleAppStates {
  final String error;

  ErrorBusinessArticlesAppState(this.error);
}

class LoadingScienceArticlesAppState extends ArticleAppStates {}

class SuccessScienceArticlesAppState extends ArticleAppStates {
  final List<Article> article;

  SuccessScienceArticlesAppState(this.article);
}

class ErrorScienceArticlesAppState extends ArticleAppStates {
  final String error;

  ErrorScienceArticlesAppState(this.error);
}

class LoadingSportArticlesAppState extends ArticleAppStates {}

class SuccessSportArticlesAppState extends ArticleAppStates {
  final List<Article> article;

  SuccessSportArticlesAppState(this.article);
}

class ErrorSportArticlesAppState extends ArticleAppStates {
  final String error;

  ErrorSportArticlesAppState(this.error);
}

class LoadingSearchArticlesAppState extends ArticleAppStates {}

class SuccessSearchArticlesAppState extends ArticleAppStates {
  final List<Article> article;

  SuccessSearchArticlesAppState(this.article);
}

class ErrorSearchArticlesAppState extends ArticleAppStates {
  final String error;

  ErrorSearchArticlesAppState(this.error);
}

class ChangeBottomNavBarState extends ArticleAppStates {}
