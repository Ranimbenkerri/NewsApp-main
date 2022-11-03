import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit.dart/cubit.dart';
import 'package:news_app/cubit.dart/states.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    NewsCubit.get(context).Chngtheme();
                    cubit.changebtn(true);
                  },
                  icon: Icon(Icons.brightness_4_rounded),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentindex,
              items: cubit.bottomNav,
              onTap: (index) {
                cubit.changbtn(index);
              },
            ),
            body: cubit.Screens[cubit.currentindex],
          );
        },
      ),
    );
  }
}
