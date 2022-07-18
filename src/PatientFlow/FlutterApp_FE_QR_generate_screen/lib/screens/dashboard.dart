import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io' as io;

import 'package:abdm_project/screens/qr.dart';
import 'package:abdm_project/widgets/showmodalsheet.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Uint8List? image;

  Future<void> getQRCode(BuildContext context) async {
    // String variab = "abc";
    String url = "https://abdm-qr.herokuapp.com/qrcode/shams12345";
    var body = {
      "abha": "1234",
      "current_medication": "yes",
      "allergies": "yes",
      "family_history": "yes",
      "past_treatment_history": "yes"
    };
    var response = await http.post(Uri.parse(url),
        headers: {"Content-type": "image/png"}, body: json.encode(body));

    try {
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        print("doneeeeee");
        var responsefinal = response.bodyBytes;
        print(responsefinal.runtimeType);

        setState(() {
          image = responsefinal;
          print(image);
        });

        Qrcodeimage();

        // getfinalQr();
      } else {
        print("something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Widget Qrcodeimage() {
    return Image.memory(image!);
  }

  List textString = [
    "Store your health records",
    "share it with your trust",
    "prserves privacy - Security"
  ];
  Widget textRowText(BuildContext context, String icontext) {
    return Row(
      children: [
        Icon(FeatherIcons.checkCircle, size: 16),
        SizedBox(
          width: 10,
        ),
        Text(
          icontext,
          style: GoogleFonts.poppins(fontSize: 12),
        )
      ],
    );
  }

  bool loading = true;

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('health records',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('appointment',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('profile',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getQRCode(context);
  }

  // PhotoGetController photoGetController = Get.put(PhotoGetController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // backgroundColor: Color(0Xffd8d8d8),
            body: ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 12, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => print("ok"),
                            child: Text(
                              "Marisela R",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff073763),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Row(
                            children: [
                              Icon(FeatherIcons.mapPin),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Location",
                                style: GoogleFonts.poppins(color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(FeatherIcons.chevronDown)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Row(
                          children: const [
                            Icon(
                              FeatherIcons.search,
                              color: Color(0xff073763),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 12,
                            left: 12,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "with certified issues",
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Generate",
                                      style: GoogleFonts.poppins(
                                          color: Colors.green.shade800,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: " Smart",
                                          style: GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 4, 13, 18),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ]),
                                ),
                                // SizedBox(height: 10,),
                                RichText(
                                  text: TextSpan(
                                    text: "Health",
                                    style: GoogleFonts.poppins(
                                        color: Color.fromARGB(255, 4, 13, 18),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: " Card",
                                        style: GoogleFonts.poppins(
                                            color: Colors.green.shade800,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                textRowText(context, textString[0]),
                                SizedBox(
                                  height: 10,
                                ),
                                textRowText(context, textString[1]),
                                SizedBox(
                                  height: 10,
                                ),
                                textRowText(context, textString[2]),
                                SizedBox(
                                  height: 15,
                                ),

                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BottomSheetOkBro();
                                        });
                                  },
                                  child: Container(
                                    width: 160,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 12),
                                    child: Text(
                                      "Custom your card",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xff239a23),
                                        borderRadius:
                                            BorderRadius.circular(17)),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      // Positioned(
                      //     bottom: 10,
                      //     right: -10,
                      //     child: Container(
                      //       height: 200,
                      //       width: 220,
                      //       decoration: BoxDecoration(
                      //           // color: Colors.amber,
                      //           image: DecorationImage(
                      //               image: AssetImage("assets/2.png"),
                      //               fit: BoxFit.fill)),
                      //     ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Positioned(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.amber),
                                  //           boxShadow: [
                                  //             BoxShadow(
                                  //   color: Colors.grey.withOpacity(0.5),
                                  //   offset: const Offset(
                                  //     20.0,
                                  //     20.0,
                                  //   ),
                                  //   blurRadius: 10.0,
                                  //   spreadRadius: 10,
                                  // ),
                                  //           ],

                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.white
                                  // color: Colors.amber.withOpacity(0.5),
                                  ),
                              child: Container(
                                padding: const EdgeInsets.only(top: 20, left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      FeatherIcons.userCheck,
                                      size: 28,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Symptoms",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600, fontSize: 17),
                                    ),
                                    // SizedBox(height: 5,),
                                    Text(
                                      "checker",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600, fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: -30,
                            right: -25,
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/1.png"),
                                ),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            height: 150,
                            width: 173,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.amber),
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white
                                // color: Colors.amber.withOpacity(0.5),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    FeatherIcons.fileText,
                                    size: 28,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "List",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600, fontSize: 17),
                                  ),
                                  // SizedBox(height: 5,),
                                  Text(
                                    "hospitals",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600, fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: -30,
                            right: -17,
                            child: Container(
                              height: 200,
                              width: 220,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/3.png"),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.lightBlue.withOpacity(0.2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Creating indias Digital \nhealth ecosystem",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "ABHA-Ayushman Bharath Health\nAccount key to your Digital \nhealth care journey",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: 2,
                  ),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.heart),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.calendar),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.user),
                  label: 'School',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xff073763),
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
            )));
  }
}
