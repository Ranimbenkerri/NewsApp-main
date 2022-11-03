import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news_app/Components/widgets.dart';
import 'package:news_app/cubit.dart/cubit.dart';
import 'package:news_app/cubit.dart/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Businessscreen extends StatelessWidget {
  const Businessscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = NewsCubit.get(context).business;

        return ConditionalBuilder(
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleitem(list[index], context),
              separatorBuilder: (context, index) => Divider(
                    height: 10,
                  ),
              itemCount: 60),
          condition: state is! NewsBusinessloading,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
