import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_router.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/logic/cubit/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(NewsApp(
    appRouter: AppRouter(),
  ));
}

class NewsApp extends StatelessWidget {
  NewsApp({super.key, required this.appRouter});

  AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.blueDegree4,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.blueDegree4,
          titleTextStyle: TextStyle(
            color: AppColors.blueDegree1,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
