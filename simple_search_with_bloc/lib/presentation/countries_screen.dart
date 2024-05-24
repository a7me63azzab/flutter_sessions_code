import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_search_with_bloc/data/repository/countries_repository_impl.dart';
import 'package:simple_search_with_bloc/domain/use_cases/get_all_countries_usecases.dart';
import 'package:simple_search_with_bloc/domain/use_cases/search_countries_usecases.dart';
import 'package:simple_search_with_bloc/presentation/bloc/bloc.dart';
import 'package:simple_search_with_bloc/presentation/bloc/events.dart';
import 'package:simple_search_with_bloc/presentation/widgets/countries_body.dart';

class AllCountriesScreen extends StatelessWidget {
  const AllCountriesScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocProvider<CountriesBloc>(
        create: (context) {
          final CountriesRepositoryImpl countriesRepositoryImpl =
              CountriesRepositoryImpl();
          final GetAllCountriesUseCase getAllCountriesUseCase =
              GetAllCountriesUseCase(countriesRepositoryImpl);
          final SearchCountriesUseCase searchCountriesUseCase =
              SearchCountriesUseCase(countriesRepositoryImpl);
          return CountriesBloc(
            getAllCountriesUseCase,
            searchCountriesUseCase,
          )..add(
              GetAllCountriesEvents(),
            );
        },
        child: const AllCountriesBody(),
      ),
    );
  }
}
