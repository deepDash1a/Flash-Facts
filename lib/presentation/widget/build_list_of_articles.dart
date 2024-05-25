import 'package:flutter/material.dart';
import 'package:news_app/data/model/article_model.dart';
import 'package:news_app/presentation/widget/single_article_item.dart';

class BuildListOfArticles extends StatelessWidget {
  BuildListOfArticles({super.key, required this.list});

  List<Article> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => myDivider(10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SingleArticleItem(article: list[index]),
      itemCount: list.length,
    );
  }

  Widget myDivider(double height) {
    return SizedBox(
      height: height,
    );
  }
}
