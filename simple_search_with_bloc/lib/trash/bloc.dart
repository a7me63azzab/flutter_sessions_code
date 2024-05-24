// // enum {
// //   loginButtonClicked,
// //   forgetPassword,
// //   signup
// // }

// // abstract class LoginEvents {}

// // class LoginStarted extends LoginEvents{
// //   final String email;
// //   final String password;

// //   LoginStarted(this.email,this.password);
// // }










// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AuthBloc extends Bloc<AuthEvents, AuthStates> {
//   final AuthRepo authRepo;
//   AuthBloc(this.authRepo) : super(InitialState()) {
//     on((event, emit) async {
//       switch (event) {
//         case LoginEvent():
//           emit(Loading());

//           ApiResult result = await authRepo.login();

//           var state = switch (result) {
//             SuccessResult() => Success(result.successData),
//             FailedResult() => Failed(result.failedData),
//           };

//           emit(state);

//         case SignupEvent():
//         // Signup ...
//         case Logout():
//         // Logout ...
//       }
//     });
//   }
// }




// class AuthRepo {
//   Future<ApiResult> login() async {
//     // ....
//     // throw UnimplementedError();
//     return SuccessResult("success");
//   }
// }

// typedef Any = dynamic;

// sealed class ApiResult {}

// class SuccessResult extends ApiResult {
//   final Any successData;
//   SuccessResult(this.successData);
// }

// class FailedResult extends ApiResult {
//   final Any failedData;
//   FailedResult(this.failedData);
// }

// class AuthScreen extends StatelessWidget {
//   AuthScreen({super.key});

//   final AuthBloc _bloc = AuthBloc();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SubjectBloc(),
//       child: Scaffold(
//         body: Column(
//           children: [
//             BlocListener<AuthBloc, AuthStates>(
//               bloc: _bloc,
//               listener: (context, state) {
//                 // Make some actions in response to state changes.
//                 switch (state) {
//                   case Success():
//                   // navigate to home page ...
//                   case Failed():
//                   // Display Error Message ...
//                   case _:
//                     null;
//                 }
//               },
//               child: Container(),
//             ),

//             // Bloc Builder
//             BlocBuilder<AuthBloc, AuthStates>(
//               builder: (context, state) {
//                 return switch (state) {
//                   Initial() => Container(),
//                   Loading() => const CircularProgressIndicator(),
//                   Success() => const Text("Display Success Widget"),
//                   Failed() => const Text("Display Error Widget"),
//                 };
//               },
//             ),

//             // Bloc Selector

//             BlocSelector<AuthBloc, AuthStates, String>(
//               selector: (state) {
//                 return switch (state) {
//                   Success() => "Success",
//                   _ => "Unexpected Error, Please try again later",
//                 };
//               },
//               builder: (context, String state) {
//                 return Text(state);
//               },
//             ),
//           ],
//         ),
//         floatingActionButton: BlocConsumer<AuthBloc, AuthStates>(
//           bloc: _bloc,
//           listener: (context, state) {
//             switch (state) {
//               case Success():
//                 Toast("Success");
//               case Failed():
//                 Toast("Error : ${state.data}");
//               case _:
//                 null;
//             }
//           },
//           builder: (context, state) {
//             // Map through auth states using switch statement and rebuild ui according to each state.
//             return switch (state) {
//               Loading() => const CircularProgressIndicator(),
//               _ => FloatingActionButton(onPressed: () {
//                   _bloc.add(LoginEvent(
//                       // username
//                       // password
//                       ));
//                 }),

//               // Initial() => FloatingActionButton(onPressed: () {
//               //     _bloc.add(LoginEvent(
//               //         // username
//               //         // password
//               //         ));
//               //   }),
//               // Success() => FloatingActionButton(onPressed: () {
//               //     _bloc.add(LoginEvent(
//               //         // username
//               //         // password
//               //         ));
//               //   }),
//               // Failed() => FloatingActionButton(onPressed: () {
//               //     _bloc.add(LoginEvent(
//               //         // username
//               //         // password
//               //         ));
//               //   }),
//             };
//           },
//         ),
//       ),
//     );
//   }
// }

// // sealed class AuthEvents {}

// // class LoginEvent extends AuthEvents {}

// // class SignupEvent extends AuthEvents {}

// // class Logout extends AuthEvents {}

// // sealed class AuthStates {}

// // class Initial extends AuthStates {}

// // class Loading extends AuthStates {}

// // class Success extends AuthStates {
// //   final Any data;
// //   Success(this.data);
// // }

// // class Failed extends AuthStates {
// //   final Any data;
// //   Failed(this.data);
// // }

// // abstract class CounterEvent {}

// // class CounterIncrementPressed extends CounterEvent {}

// // class CounterBloc extends Bloc<CounterEvent, int> {
// //   CounterBloc() : super(0) {
// //     on<CounterIncrementPressed>((event, emit) => emit(state + 1));
// //   }
// // }





// // // class Car {}

// // // class BMW extends Car {
// // //   BMW() : super() {
    
// // //   }
// // // }















// // // Code from Bloc Library
// // @override
// // void add(Event event) {
// //   try {
// //     onEvent(event);
// //     _eventController.add(event);
// //   } catch (error, stackTrace) {
// //     onError(error, stackTrace);
// //     rethrow;
// //   }
// // }



// // RETHROW
// // void someFunction() {
// //   try {
// //     // Code that might throw a FormatException
// //     String value = 'hello';
// //     int number = int.parse(value);
// //   } on FormatException catch (e) {
// //     print('Caught FormatException: $e'); // Basic logging
// //     rethrow; // Propagate the exception
// //   }
// // }

// // void main() {
// //   try {
// //     someFunction();
// //   } on FormatException catch (e) {
// //     print('Main function handling FormatException: $e');
// //     // Handle the exception here, providing a more informative message
// //   }
// // }





