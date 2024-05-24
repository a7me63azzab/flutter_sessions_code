class CountryLang {
  final String code;
  final String name;

  CountryLang({required this.code, required this.name});

  factory CountryLang.fromJson(Map<String, dynamic> json) => CountryLang(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "name": name,
    };
  }
}
