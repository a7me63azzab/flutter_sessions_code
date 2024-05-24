import 'package:simple_search_with_bloc/domain/country_entity.dart';

abstract class CountriesRepository {
  Future<List<CountryEntity>> getAllCountries();
  Future<List<CountryEntity>> search(String text);
}
