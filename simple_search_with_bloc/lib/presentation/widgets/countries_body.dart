import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_search_with_bloc/presentation/bloc/bloc.dart';
import 'package:simple_search_with_bloc/presentation/bloc/events.dart';
import 'package:simple_search_with_bloc/presentation/bloc/states.dart';
import 'package:simple_search_with_bloc/presentation/widgets/display_countries_list.dart';

class AllCountriesBody extends StatefulWidget {
  const AllCountriesBody({super.key});

  @override
  State<AllCountriesBody> createState() => _AllCountriesBodyState();
}

class _AllCountriesBodyState extends State<AllCountriesBody> {
  @override
  void dispose() {
    super.dispose();
  }

  void handleUserInput(String val) {
    EasyDebounce.debounce(
        'country-search',
        const Duration(milliseconds: 500),
        () => context.read<CountriesBloc>().add(
              SearchEvent(val),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (String value) {
                handleUserInput(value);
              },
              decoration: InputDecoration(
                hintText: "Search ...",
                suffixIcon: const Icon(CupertinoIcons.search),
                contentPadding: const EdgeInsets.all(5),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<CountriesBloc, CountriesStates>(
            builder: (context, state) {
              return switch (state) {
                SuccessState() => DisplayAllCountriesWidget(
                    countries: state.countries,
                  ),
                NoDataState() => const Center(
                    child: Text("No Data"),
                  ),
                FailedState() => Center(
                    child: Text("Error _: ${state.error} "),
                  ),
                _ => const Expanded(
                    child: Center(child: CircularProgressIndicator())),
              };
            },
          )
        ],
      ),
    );
  }
}


