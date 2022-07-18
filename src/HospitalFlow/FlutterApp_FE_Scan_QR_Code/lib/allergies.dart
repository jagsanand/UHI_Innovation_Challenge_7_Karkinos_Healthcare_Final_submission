import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Allergy extends StatelessWidget {
  const Allergy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Medication",style: GoogleFonts.poppins(fontWeight:FontWeight.bold),),
            // SizedBox(height: 10,),
            // Text("Telmisartan 20 mg oral tablet",style: GoogleFonts.poppins(fontSize: 18),)
    
          ],
        ),
    
      )),
    );
    
  }
}