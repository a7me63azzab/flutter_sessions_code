import 'package:simple_search_with_bloc/data/models/country_model.dart';
import 'package:simple_search_with_bloc/domain/country_entity.dart';

class CountryMapper {
  static CountryEntity toEntity(CountryModel countryModel) {
    return CountryEntity(
      name: countryModel.name,
      capital: countryModel.capital,
      code: countryModel.code,
      flag: countryModel.flag,
    );
  }

  static List<CountryEntity> toEntityList(List<CountryModel> models) {
    return models
        .map(
          (e) => toEntity(e),
        )
        .toList();
  }
}
