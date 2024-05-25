import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/logic/cubit/cubit.dart';
import 'package:news_app/logic/cubit/state.dart';
import 'package:news_app/presentation/screens/search_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = ArticleAppCubit.get(context);
    return BlocBuilder<ArticleAppCubit, ArticleAppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titleStrings[cubit.currentIndex],
              style: const TextStyle(
                fontSize: 20.00,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search_outlined,
                  color: AppColors.blueDegree1,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: cubit.bodyScreens[cubit.currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: cubit.bottomNavigationBarItems,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
          // body: ,
        );
      },
    );
  }
}
