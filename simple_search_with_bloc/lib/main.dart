import 'package:flutter/material.dart';
import 'package:simple_search_with_bloc/presentation/countries_screen.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AllCountriesScreen(title: 'Flutter Bloc Demo'),
    );
  }
}


// class PhoneChanged extends LoginEvent{}
