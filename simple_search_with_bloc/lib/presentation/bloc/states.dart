import 'package:simple_search_with_bloc/domain/country_entity.dart';

sealed class CountriesStates {}

class InitialState extends CountriesStates {}

class LoadingState extends CountriesStates {}

class NoDataState extends CountriesStates {}

class SuccessState extends CountriesStates {
  List<CountryEntity> countries;
  SuccessState(this.countries);
}

class FailedState extends CountriesStates {
  String error;
  FailedState(this.error);
}
