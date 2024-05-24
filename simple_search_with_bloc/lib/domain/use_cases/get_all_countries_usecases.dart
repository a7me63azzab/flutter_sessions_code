import 'package:simple_search_with_bloc/domain/countries_repository.dart';
import 'package:simple_search_with_bloc/domain/country_entity.dart';

class GetAllCountriesUseCase {
  CountriesRepository countriesRepository;
  GetAllCountriesUseCase(this.countriesRepository);

  Future<List<CountryEntity>> execute(){
    return countriesRepository.getAllCountries();
  }
}