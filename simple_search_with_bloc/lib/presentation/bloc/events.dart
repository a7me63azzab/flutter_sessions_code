sealed class CountriesEvents {}

class GetAllCountriesEvents extends CountriesEvents {}

class SearchEvent extends CountriesEvents {
  String text;
  SearchEvent(this.text);
}

class FailedEvent extends CountriesEvents {
  String error;
  FailedEvent(this.error);
}
