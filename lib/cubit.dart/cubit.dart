import 'package:flutter/material.dart';
import 'package:news_app/cubit.dart/states.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/business/bus_Screen.dart';
import 'package:news_app/Screens/science/science.dart';
import 'package:news_app/Screens/settings/Settings.dart';
import 'package:news_app/Screens/sports/sports.dart';
import '../helpers/DioHelper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavigationBarItem> bottomNav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
      backgroundColor: Colors.black,
    ),
  ];
  // ignore: non_constant_identifier_names
  List<Widget> Screens = [
    Businessscreen(),
    Sports(),
    Science(),
    Settings(),
  ];

  void changbtn(int index) {
    currentindex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsNavigatorbar());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsBusinessloading());
    DioHalper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '368a9ce186d64e468e28ef00a4ad50c9',
      },

      //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=368a9ce186d64e468e28ef00a4ad50c9
    ).then((value) {
      business = value.data['articles'];
      emit(NewsgetBusiness());
    }).catchError(
      (error) {
        emit(NewsGetBusinessErrorState(error.toString()));
      },
    );
  }

  List<dynamic> sports = [];

  void getSports() {
    if (sports.length == 0) {
      emit(NewsSportsloading());
      DioHalper.getdata(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '368a9ce186d64e468e28ef00a4ad50c9',
        },

        //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=368a9ce186d64e468e28ef00a4ad50c9
      ).then((value) {
        sports = value.data['articles'];

        emit(NewsgetSports());
      }).catchError(
        (error) {
          emit(NewsGetSportsErrorState(error.toString()));
        },
      );
    } else {
      emit(NewsgetSports());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    if (science.length == 0) {
      emit(NewsScienceloading());
      DioHalper.getdata(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '368a9ce186d64e468e28ef00a4ad50c9',
        },

        //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=368a9ce186d64e468e28ef00a4ad50c9
      ).then((value) {
        science = value.data['articles'];

        emit(NewsgetScience());
      }).catchError(
        (error) {
          emit(NewsGetScienceErrorState(error.toString()));
        },
      );
    } else {
      emit(NewsgetScience());
    }
  }

  bool isDark = true;
  // ignore: non_constant_identifier_names
  void Chngtheme() {
    isDark = !isDark;
    emit(ChangeTheme());
  }

  void changebtn(bool isDark) {
    if (isDark == true) {
      icon:
      Icon(Icons.brightness_4_rounded);
    }
    if (isDark == false) {
      icon:
      Icon(Icons.brightness_4_outlined);
    }
    emit(changebutton());
  }
}
