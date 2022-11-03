import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Components/widgets.dart';
import '../../cubit.dart/cubit.dart';
import '../../cubit.dart/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class Sports extends StatelessWidget {
  const Sports({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = NewsCubit.get(context).sports;
        
        return ConditionalBuilder(
          builder: (context) {
            var listView = ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleitem(list[index],context),
              separatorBuilder: (context, index) => Divider(
                    height: 10,
                  ),
              itemCount: 69);
            return listView;
          },
          condition: list.length >0,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    
  }
}
