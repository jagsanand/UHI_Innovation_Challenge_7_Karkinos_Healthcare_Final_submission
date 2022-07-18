import 'dart:ffi';

import 'package:abdm_project/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        
        children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height * 0.50,
          child: Container(
            child: MyWidget(),

            
            width: double.infinity,
           decoration:const BoxDecoration(
             color: Color(0xff073763),
             borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18),),
           ),
            
        
          ),
        ),
        Positioned(
          top: 200,
          left: 20,
          right: 20,
          child: Column(
          children: [
            Container(alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 10),
              child: Text(
              "SMART",
              style: GoogleFonts.poppins(
                  color: Color(0xff073763), fontWeight: FontWeight.bold, fontSize: 40),
          ),
            ),
          Text("H  E  A  L  T  H")
            
          ],
        ))
      
      ],
      ),
    );
  }
}
