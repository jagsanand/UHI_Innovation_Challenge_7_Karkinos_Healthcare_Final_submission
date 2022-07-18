import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class FamilHistory extends StatelessWidget {
  const FamilHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Family History",style: GoogleFonts.poppins(fontWeight:FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Father Diagnosed with prostate cancer at age of 65 ",style: GoogleFonts.poppins(fontSize: 18),)
    
          ],
        ),
    
      )),
    );
    
  }
}