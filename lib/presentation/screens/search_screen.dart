import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/data/model/article_model.dart';
import 'package:news_app/presentation/widget/article_componets.dart';
import 'package:news_app/presentation/widget/single_article_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  static var searchedController = TextEditingController();
  List<Article> searchedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18.00,
            color: AppColors.blueDegree1,
          ),
        ),
        title: const Text(
          'Global Search',
          style: TextStyle(
            fontSize: 20.00,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.blueDegree3.withOpacity(0.2),
              ),
              child: TextField(
                controller: searchedController,
                decoration: const InputDecoration(
                  hintText: 'Search here...',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 10.00,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (character) {
                  // cubit.getPublicSearchedList(character);
                },
              ),
            ),
            myDivider(30.00),
            searchedController.text.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) => SingleArticleItem(
                      article: searchedList[index],
                    ),
                    itemCount: searchedList.length,
                  )
                : const Center(
                    child: Text(
                      'No data',
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
