import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TextandButton extends StatelessWidget {
  final String text;
  final bool isDivider;
  final IconData icon;
  TextandButton(
      {required this.text, required this.icon, required this.isDivider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                                text,
                                style: GoogleFonts.poppins(color: Colors.grey,fontSize: 17),
                              ),
              Icon(icon,color: Colors.grey,),
            ],
          ),
          SizedBox(height: 15,),
          isDivider?Divider(color: Colors.grey.withOpacity(0.3),thickness: 2,indent: 5,endIndent: 5,):Container()
          

        ],
      ),
    );
  }
}
