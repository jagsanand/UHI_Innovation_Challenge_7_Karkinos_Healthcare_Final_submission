import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 20, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
              color: Colors.grey.withOpacity(0.4),
              thickness: 3,
              endIndent: 150,
              indent: 150),
          SizedBox(
            height: 18,
          ),
          Text(
            "Welcome back to",
            style: GoogleFonts.poppins(color: Colors.grey),
          ),
          // SizedBox(height: 10,),
          Text(
            "Smart Health",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: TextFieldContainer(
              child: const TextField(
                decoration: InputDecoration(
                    hintText: "ABHA Number",
                    border: InputBorder.none,
                    icon: Icon(FeatherIcons.key)),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
              child: Text("Login",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w700),),
              decoration: BoxDecoration(
                color: Color(0xfffc7c14),
                borderRadius: BorderRadius.circular(14)

              ),
            ),
            
          ),
          SizedBox(height: 50,),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Smart Health",
              style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w500, fontSize: 19),
            ),
          ),
          SizedBox(height: 8,),
          Align(
            alignment: Alignment.center,
            child: Text(
            "v 0.0.1",
            style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.5)),
          ),
          )

        ],
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  TextFieldContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      child: child,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
