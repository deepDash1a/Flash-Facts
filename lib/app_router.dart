import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/strings.dart';
import 'package:news_app/data/repository/article_repository.dart';
import 'package:news_app/data/web_services/article_web_services.dart';
import 'package:news_app/logic/cubit/cubit.dart';
import 'package:news_app/presentation/screens/layout_screen/layout_screen.dart';
import 'package:news_app/presentation/screens/web_screen.dart';

class AppRouter {
  ArticleRepository? articleRepository;
  ArticleAppCubit? articleAppCubit;

  AppRouter() {
    articleRepository = ArticleRepository(ArticleWebServices());
    articleAppCubit = ArticleAppCubit(articleRepository!);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case layoutScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (BuildContext context) =>
                    ArticleAppCubit(articleRepository!),
                child: const LayoutScreen(),
              ),
        );

         }
    return null;
  }
}
