import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_search_with_bloc/domain/country_entity.dart';
import 'package:simple_search_with_bloc/domain/use_cases/get_all_countries_usecases.dart';
import 'package:simple_search_with_bloc/domain/use_cases/search_countries_usecases.dart';
import 'package:simple_search_with_bloc/presentation/bloc/events.dart';
import 'package:simple_search_with_bloc/presentation/bloc/states.dart';

class CountriesBloc extends Bloc<CountriesEvents, CountriesStates> {
  final GetAllCountriesUseCase _getAllCountriesUseCase;
  final SearchCountriesUseCase _searchCountriesUseCase;
  CountriesBloc(this._getAllCountriesUseCase, this._searchCountriesUseCase)
      : super(InitialState()) {
    on<CountriesEvents>((event, emit) async {
      switch (event) {
        case GetAllCountriesEvents():
          emit(LoadingState());
          List<CountryEntity> countries =
              await _getAllCountriesUseCase.execute();
          // addError("Un expected error, please try again later");
          if (countries.isEmpty) {
            emit(NoDataState());
          } else {
            emit(SuccessState(countries));
          }
        case SearchEvent():
          if (kDebugMode) {
            print("Text : ${event.text}");
          }
          List<CountryEntity> countries =
              await _searchCountriesUseCase.execute(event.text);
          addError("Not Found");
          if (countries.isEmpty) {
            emit(NoDataState());
          } else {
            emit(SuccessState(countries));
          }
        case FailedEvent():
          emit(FailedState(event.error));
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(error);
    }
    add(
      FailedEvent(error as String),
    );
    super.onError(error, stackTrace);
  }
}
