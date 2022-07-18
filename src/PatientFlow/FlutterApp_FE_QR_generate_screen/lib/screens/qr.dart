import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QrImage extends StatefulWidget {
  final Uint8List image;
  QrImage({required this.image});

  @override
  State<QrImage> createState() => _QrImageState();
}

class _QrImageState extends State<QrImage> {
  late Uint8List value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = widget.image;
  }


  @override
  Widget build(BuildContext context) {
    Widget showWidget() {
      return Align(
        alignment: Alignment.center,
        child: Container(height: 180, child: value == null?Container(): Image.memory(value)));
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12,),
          child: Center(
            child: Container(
              alignment: Alignment.topLeft,
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff106ABC), Color(0xff042C50)]),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/4.png",
                                ),
                                fit: BoxFit.cover),
                            // image: DecorationImage(image: AssetImage("assets"))
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Marisela R",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Health-ID : ",
                                    style:
                                        GoogleFonts.poppins(color: Colors.white),
                                    children: [
                                      TextSpan(
                                          text: "12-1234-12",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                

                  showWidget(),
              
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
