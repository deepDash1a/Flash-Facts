import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/article_model.dart';
import 'package:news_app/logic/cubit/cubit.dart';
import 'package:news_app/logic/cubit/state.dart';
import 'package:news_app/presentation/widget/build_list_of_articles.dart';
import 'package:news_app/presentation/widget/show_loading_indicator.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  List<Article> businessArticle = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleAppCubit>(context).getBusinessArticles();
  }

  Widget articleItem() {
    return BlocBuilder<ArticleAppCubit, ArticleAppStates>(
        builder: (context, state) {
      if (state is SuccessBusinessArticlesAppState) {
        businessArticle = state.article;
        return buildSuccessListOfArticles();
      } else {
        return const ShowLoadingIndicator();
      }
    });
  }

  Widget buildSuccessListOfArticles() {
    return Column(
      children: [
        BuildListOfArticles(list: businessArticle),
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
