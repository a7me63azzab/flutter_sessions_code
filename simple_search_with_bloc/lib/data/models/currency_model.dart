class CountryCurrency {
  final String code;
  final String name;
  final String symbol;

  CountryCurrency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory CountryCurrency.fromJson(Map<String, dynamic> json) =>
      CountryCurrency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "name": name,
      "symbol": symbol,
    };
  }
}

