import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/images.dart';
import 'package:news_app/data/model/article_model.dart';
import 'package:news_app/data/repository/article_repository.dart';
import 'package:news_app/logic/cubit/state.dart';
import 'package:news_app/presentation/screens/business_screen.dart';
import 'package:news_app/presentation/screens/science_screen.dart';
import 'package:news_app/presentation/screens/sport_screen.dart';

class ArticleAppCubit extends Cubit<ArticleAppStates> {
  ArticleAppCubit(this.articleRepository) : super(InitializeArticleAppState());

  static ArticleAppCubit get(context) => BlocProvider.of(context);

  // variables
  final ArticleRepository articleRepository;
  int currentIndex = 0;

  // lists
  List<Article> businessArticle = [];
  List<Article> scienceArticle = [];
  List<Article> sportArticle = [];
  List<Article> searchedList = [];
  List<String> titleStrings = [
    'Business News',
    'Science News',
    'Sport News',
  ];
  List<Widget> bodyScreens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Image.asset(
        AppImages.businessGifIcon,
        height: 20,
        width: 20,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        AppImages.scienceGifIcon,
        height: 20,
        width: 20,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        AppImages.sportGifIcon,
        height: 20,
        width: 20,
      ),
      label: 'Sports',
    ),
  ];

  // functions
  List<Article> getBusinessArticles() {
    try {
      emit(LoadingBusinessArticlesAppState());
      articleRepository.getBusinessArticles().then((article) {
        businessArticle = article;
        print(businessArticle.length);
        emit(SuccessBusinessArticlesAppState(article));
      });
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
        emit(ErrorBusinessArticlesAppState(error.toString()));
      }
    }
    return businessArticle;
  }

  List<Article> getScienceArticles() {
    try {
      emit(LoadingScienceArticlesAppState());
      articleRepository.getScienceArticles().then((article) {
        scienceArticle = article;
        print(scienceArticle.length);

        emit(SuccessScienceArticlesAppState(article));
      });
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
        emit(ErrorScienceArticlesAppState(error.toString()));
      }
    }
    return scienceArticle;
  }

  List<Article> getSportArticles() {
    try {
      emit(LoadingSportArticlesAppState());
      articleRepository.getSportArticles().then((article) {
        sportArticle = article;
        if (kDebugMode) {
          print(sportArticle.length);
        }
        emit(SuccessSportArticlesAppState(article));
      });
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
        emit(ErrorSportArticlesAppState(error.toString()));
      }
    }
    return sportArticle;
  }

  List<Article> getPublicSearchedList(val) {
    try {
      emit(LoadingSearchArticlesAppState());
      articleRepository.getSearchedArticles(val).then((value) {
        searchedList = value;
        if (kDebugMode) {
          print(searchedList);
        }
        emit(SuccessSearchArticlesAppState(searchedList));
      });
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
        emit(ErrorSearchArticlesAppState(error.toString()));
      }
    }
    return sportArticle;
  }

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
