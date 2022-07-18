import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueCardWidgeet extends StatelessWidget {
  double? height;
  bool? isQr;
  final Uint8List value;
  BlueCardWidgeet({Key? key, this.height, this.isQr,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 12).copyWith(top: 10),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient:
              LinearGradient(colors: [Color(0xff106ABC), Color(0Xff042c50)])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/4.png"), fit: BoxFit.fill)),
              ),
              SizedBox(
                width: 14,
              ),
              Container(
                height: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Marisela R",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Health ID : ",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 11),
                        children: [
                          TextSpan(
                              text: "12-1234-1234",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              columnWidths: {0: FractionColumnWidth(0.33)},
              children: [
                TableRow(
                  children: [
                    Text(
                      "PHR-Address  : ",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 11),
                    ),
                    Text(
                      "Marisela@gmail.com",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    )
                  ],
                ),
                TableRow(children: [
                  Text(
                    "Date of Birth   : ",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                  Text(
                    "19/06/2023",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  )
                ]),
                TableRow(children: [
                  Text(
                    "Gender            : ",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                  Text(
                    "female",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  )
                ]),
                TableRow(children: [
                  Text(
                    "Mobile              : ",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                  Text(
                    "9019464961",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  )
                ]),
              ],
            ),
          ),
          isQr != null?Align(
            alignment: Alignment.centerLeft,
            child: showWidget()):Container()
        ],
      ),
    );
  }
    Widget showWidget() {
      return Container(height: 150, child: value == null?Container(): Image.memory(value));
    }

}

