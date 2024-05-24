import 'package:simple_search_with_bloc/data/database/data.dart';
import 'package:simple_search_with_bloc/data/mapper/country_mapper.dart';
import 'package:simple_search_with_bloc/data/models/country_model.dart';
import 'package:simple_search_with_bloc/domain/countries_repository.dart';
import 'package:simple_search_with_bloc/domain/country_entity.dart';

class CountriesRepositoryImpl implements CountriesRepository {
  @override
  Future<List<CountryEntity>> getAllCountries() async {
    List<Map<String, dynamic>> countriesJson = JsonData.countries;
    List<CountryModel> countriesDataList = countriesJson
        .map(
          (country) => CountryModel(
            name: country["name"],
            code: country["code"],
            capital: country["capital"],
            region: country["region"],
            currency: null,
            language: null,
            flag: country["flag"],
            diallingCode: country["dialling_code"],
            isoCode: country["isoCode"],
          ),
        )
        .toList();

    await Future.delayed(const Duration(seconds: 2));

    return CountryMapper.toEntityList(countriesDataList);
    // return [];
  }

  @override
  Future<List<CountryEntity>> search(String text) async {
    List<Map<String, dynamic>> countriesJson = JsonData.countries;
    List<CountryModel> countriesDataList = countriesJson
        .map(
          (country) => CountryModel(
            name: country["name"],
            code: country["code"],
            capital: country["capital"],
            region: country["region"],
            currency: null,
            language: null,
            flag: country["flag"],
            diallingCode: country["dialling_code"],
            isoCode: country["isoCode"],
          ),
        )
        .toList();

    // await Future.delayed(const Duration(seconds: 2));

    List<CountryModel> result = countriesDataList
        .where(
          (element) => element.name.contains(text),
        )
        .toList();

    return CountryMapper.toEntityList(result);
  }
}
