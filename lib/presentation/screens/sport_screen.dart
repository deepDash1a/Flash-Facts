import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/article_model.dart';
import 'package:news_app/logic/cubit/cubit.dart';
import 'package:news_app/logic/cubit/state.dart';
import 'package:news_app/presentation/widget/build_list_of_articles.dart';
import 'package:news_app/presentation/widget/show_loading_indicator.dart';

class SportScreen extends StatefulWidget {
  const SportScreen({super.key});

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  List<Article> sportArticle = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleAppCubit>(context).getSportArticles();
  }

  Widget articleItem() {
    return BlocBuilder<ArticleAppCubit, ArticleAppStates>(
        builder: (context, state) {
          if (state is SuccessSportArticlesAppState) {
            sportArticle = state.article;
            return buildSuccessListOfArticles();
          } else {
            return const ShowLoadingIndicator();
          }
        });
  }

  Widget buildSuccessListOfArticles() {
    return Column(
      children: [
        BuildListOfArticles(list: sportArticle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            articleItem(),
          ],
        ),
      ),
    );
  }
}
