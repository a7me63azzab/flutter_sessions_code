import 'package:simple_search_with_bloc/domain/countries_repository.dart';
import 'package:simple_search_with_bloc/domain/country_entity.dart';

class SearchCountriesUseCase {
  CountriesRepository countriesRepository;
  SearchCountriesUseCase(this.countriesRepository);

  Future<List<CountryEntity>> execute(String text) {
    return countriesRepository.search(text);
  }
}
