import 'package:abdm_project/screens/dashboard.dart';
import 'package:abdm_project/screens/finalscreen.dart';
import 'package:abdm_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ffi';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DashBoard());
  }
}

// c    lass Pateintscreen extends StatelessWidget {
//   const Pateintscreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: ElevatedButton(onPressed: (){
//         showModalBottomSheet(context: context, builder: builder)
//       }, child: child),),
//     );

//   }
// }
