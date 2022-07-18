import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class PastTreatment extends StatelessWidget {
  const PastTreatment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Last updated",style: GoogleFonts.poppins(fontWeight:FontWeight.bold),),
            SizedBox(height: 10,),
            Text("2020-07-09T15:32:26.605+05:30 ",style: GoogleFonts.poppins(fontSize: 18),)
    
          ],
        ),
    
      )),
    );
    
    
  }
}