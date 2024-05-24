import 'package:simple_search_with_bloc/data/models/currency_model.dart';
import 'package:simple_search_with_bloc/data/models/language_model.dart';

class CountryModel {
  final String name;
  final String code;
  final String capital;
  final String region;
  final CountryCurrency? currency;
  final CountryLang? language;
  final String flag;
  final String diallingCode;
  final String isoCode;
  CountryModel({
    required this.name,
    required this.code,
    required this.capital,
    required this.region,
    required this.currency,
    required this.language,
    required this.flag,
    required this.diallingCode,
    required this.isoCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json['name'],
        code: json['code'],
        capital: json['capital'],
        region: json['region'],
        currency: json['currency'],
        language: json['language'],
        flag: json['flag'],
        diallingCode: json['dialling_code'],
        isoCode: json['isoCode'],
      );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "code": code,
      "capital": capital,
      "region": region,
      "currency": currency,
      "language": language,
      "flag": flag,
      "dialling_code": diallingCode,
      "isoCode": isoCode,
    };
  }
}
