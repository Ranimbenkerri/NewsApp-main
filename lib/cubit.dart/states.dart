abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class NewsNavigatorbar extends NewsStates {}

class NewsBusinessloading extends NewsStates {}

class NewsgetBusiness extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}


class NewsSportsloading extends NewsStates {}

class NewsgetSports extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsScienceloading extends NewsStates {}

class NewsgetScience extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class ChangeTheme extends NewsStates {}
class changebutton extends NewsStates{}