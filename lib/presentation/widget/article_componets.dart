import 'package:flutter/material.dart';
import 'package:news_app/data/model/article_model.dart';
import 'package:news_app/presentation/widget/single_article_item.dart';

Widget showLoadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildSuccessListOfArticles(
    SingleArticleItem singleArticleItem, List<Article> list) {
  return Column(
    children: [
      buildListOfArticles(singleArticleItem, list),
    ],
  );
}

Widget myDivider(double height) {
  return SizedBox(
    height: height,
  );
}

Widget buildListOfArticles(
    SingleArticleItem singleArticleItem, List<Article> list) {
  return ListView.separated(
    separatorBuilder: (context, index) => myDivider(10),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) => SingleArticleItem(article: list[index]),
    itemCount: list.length,
  );
}
