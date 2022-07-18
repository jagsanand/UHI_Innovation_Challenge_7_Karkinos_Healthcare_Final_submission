import 'dart:typed_data';

import 'package:abdm_project/widgets/BlueCardWidgeet.dart';
import 'package:abdm_project/widgets/bluecardwidget.dart';
import 'package:abdm_project/widgets/textandbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalScreen extends StatefulWidget {
  final Uint8List image;
  const FinalScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  late Uint8List val;
  @override
  void initState() {
    // TODO: implement initState
    val = widget.image;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
         padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "profile",
               style: GoogleFonts.poppins(color: Colors.grey),
             ),
             Text(
               "Smart Health Card",
               style: GoogleFonts.poppins(
                   color: Color(0xff073763),
                   fontWeight: FontWeight.bold,
                   fontSize: 22),
             ),
             SizedBox(
               height: 20,
             ),
             BlueCardWidgeet(height: 375,isQr: true,value: val,),
             SizedBox(
               height: 35,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(
                   FeatherIcons.share2,
                   color: Colors.grey,
                 ),
                 SizedBox(
                   width: 40,
                 ),
                 Icon(FeatherIcons.download, color: Colors.grey),
                 SizedBox(
                   width: 40,
                 ),
                 Icon(FeatherIcons.printer, color: Colors.grey),
                 SizedBox(
                   width: 40,
                 ),
                 Icon(FeatherIcons.moreVertical, color: Colors.grey),
                 SizedBox(
                   width: 40,
                 ),
               ],
             ),
             SizedBox(
               height: 40,
             ),
             TextandButton(
                 text: "Terms & Condition",
                 icon: FeatherIcons.chevronRight,
                 isDivider: true),
             TextandButton(
                 text: "Privacy Policy",
                 icon: FeatherIcons.chevronRight,
                 isDivider: true),
             TextandButton(
                 text: "Logout", icon: FeatherIcons.logOut, isDivider: false),
           ],
         ),
          ),
      ),
    );
  }
}
