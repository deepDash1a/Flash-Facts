import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/images.dart';
import 'package:news_app/data/model/article_model.dart';
import 'package:news_app/presentation/screens/web_screen.dart';

class SingleArticleItem extends StatelessWidget {
  const SingleArticleItem({super.key, required this.article});

  final Article? article;

  Widget myDivider(double height) {
    return SizedBox(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              title: article!.name!,
              url: article!.url!,
            ),
          ),
        );
      },
      child: Hero(
        tag: article!.publishedAt!,
        transitionOnUserGestures: false,
        child: Card(
          color: AppColors.blueDegree1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              article!.urlToImage != null
                  ? Center(
                      child: Container(
                        width: double.infinity,
                        height: 200.00,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.00),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(article!.urlToImage!),
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      child: Image(
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          AppImages.noDataImage,
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myDivider(10),
                    Text(
                      article!.name == "[Removed]"
                          ? "This title Removed"
                          : article!.name!,
                      style: const TextStyle(
                        fontSize: 18.00,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueDegree3,
                      ),
                    ),
                    myDivider(5),
                    article!.content != null
                        ? Text(
                            article!.content == "[Removed]"
                                ? "this content removed"
                                : article!.content!.toString(),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16.00,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blueDegree4,
                            ),
                          )
                        : const Text(
                            'No content',
                            style: TextStyle(
                              fontSize: 16.00,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blueDegree4,
                            ),
                          ),
                    myDivider(5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
