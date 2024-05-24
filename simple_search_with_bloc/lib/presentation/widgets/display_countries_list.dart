import 'package:flutter/material.dart';
import 'package:simple_search_with_bloc/domain/country_entity.dart';

class DisplayAllCountriesWidget extends StatelessWidget {
  final List<CountryEntity> countries;
  const DisplayAllCountriesWidget({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(countries[index].name),
              )
            ],
          );
        },
        itemCount: countries.length,
      ),
    );
  }
}

// final Widget networkSvg = SvgPicture.network(
//   'https://site-that-takes-a-while.com/image.svg',
//   semanticsLabel: 'A shark?!',
//   placeholderBuilder: (BuildContext context) => Container(
//       padding: const EdgeInsets.all(30.0),
//       child: const CircularProgressIndicator()),
// );
