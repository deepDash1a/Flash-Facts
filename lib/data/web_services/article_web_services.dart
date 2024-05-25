import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/core/strings.dart';
import 'package:news_app/data/model/article_model.dart';

class ArticleWebServices {
  Dio? dio;

  ArticleWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    dio = Dio(baseOptions);
  }

  Future<List<Article>> getBusinessArticles() async {
    try {
      Response response = await dio!.get(
        apiBaseFunction,
        queryParameters: {
          'country': apiBaseCountry,
          'category': apiBusinessCategory,
          'apiKey': apiKey,
        },
      );
      return List<Article>.from(
        response.data['articles'].map(
          (e) => Article.fromJson(e),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future<List<Article>> getScienceArticles() async {
    try {
      Response response = await dio!.get(
        apiBaseFunction,
        queryParameters: {
          'country': apiBaseCountry,
          'category': apiScienceCategory,
          'apiKey': apiKey,
        },
      );
      return List<Article>.from(
        response.data['articles'].map(
          (e) => Article.fromJson(e),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future<List<Article>> getSportArticles() async {
    try {
      Response response = await dio!.get(
        apiBaseFunction,
        queryParameters: {
          'country': apiBaseCountry,
          'category': apiSportCategory,
          'apiKey': apiKey,
        },
      );
      return List<Article>.from(
        response.data['articles'].map(
          (e) => Article.fromJson(e),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future<List<Article>> getSearchedArticles(value) async {
    try {
      Response response = await dio!.post(
        apiBaseFunction,
        queryParameters: {
          'q': value,
          'apiKey': apiKey,
        },
      );
      return List<Article>.from(
        response.data['articles'].map(
          (e) => Article.fromJson(e),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
