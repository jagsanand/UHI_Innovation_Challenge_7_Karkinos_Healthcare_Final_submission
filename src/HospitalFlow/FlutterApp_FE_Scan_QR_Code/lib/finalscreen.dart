import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_abdm/FamilyHistory.dart';
import 'package:hospital_abdm/allergies.dart';
import 'package:http/http.dart' as http;

class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getResponse();
  }

  var valstr = {
    "qr_data":
        "shc:/1/1/5676295953265460346029254077280433602870286471674522280928614129546321673677557044633326532658763326372355274136394033334061457337775575404337714464452339404543366329383240246031222909524320603460292437404460573601064529313900327425284350226967700310740368266705253037083124446111556058316377657161277628103055632831760610654331426036582140697327331110732408655032243058376666287275230304371027521027210024093943640359652874300706032936456121305229076110276826085612402728067770403461440841310733677456336135560335392734644332443342616032694539074338615268554136714445382012716460612473676842330061612975670376635060770974403632501161307376292250315857535264383375002026315024090844576136435370201229673942092730273821060433295459090373732652212250773940642263110310757300662311037733052774442230320372362708084403356836107164672476762350722810067675754224754154300567503038291041447277526345427010682452546956394133126572530642114459606160244129545734223050032260624121447343297054672672410652535844371160647235353640503909436572503145587062413653382727217730365237316854581039527068583576292854395366034330055074643876246208002739244552004134416140684323297136614175656423356440373261693563680330733744290850316008225552122430575027305941042566206240367144715021103564403861396861076242271231587343606874653400422260123674012724287124342469096104323507683230534310404538660708062044680609355337757171373774774428580608436856526477736969043006535333056537746332125560274026754063086633713855212974"
  };

  getResponse() async {
    String url = "https://qr-scanner-decode.herokuapp.com/decode";
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(valstr),
        headers: {"Content-type": "application/json"});

    if (response.statusCode == 200) {
      print("success");
    } else {
      print("something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
              Text(
                "Marisela R",
                style: GoogleFonts.poppins(
                    color: Color(0xff073763),
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                              )),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Marisela R",
                                  style: GoogleFonts.poppins(
                                      color: Color(0xff073763),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Health-ID : ",
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff073763)),
                                      children: [
                                        TextSpan(
                                            text: "12-1234-1234",
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                color: Color(0xff073763),
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Text(
                            "PHR-Address : ",
                            style:
                                GoogleFonts.poppins(color: Color(0xff073763)),
                          ),
                          Text(
                            "Marisela@gmail.com",
                            style:
                                GoogleFonts.poppins(color: Color(0xff073763)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Text(
                            "DOB: ",
                            style:
                                GoogleFonts.poppins(color: Color(0xff073763)),
                          ),
                          Text(
                            "1981-01-12",
                            style:
                                GoogleFonts.poppins(color: Color(0xff073763)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Text(
                            "Gender: ",
                            style:
                                GoogleFonts.poppins(color: Color(0xff073763)),
                          ),
                          Text(
                            "Male",
                            style:
                                GoogleFonts.poppins(color: Color(0xff073763)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Text(
                            "Mobile : ",
                            style:
                                GoogleFonts.poppins(color: Color(0xff073763)),
                          ),
                          Text(
                            "9019464861",
                            style:
                                GoogleFonts.poppins(color: Color(0xff073763)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Allergy())),
                  child: Text(
                    "Current Medication",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Allergy())),
                  child: Text(
                    "Allergies",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FamilHistory())),
                  child: Text(
                    "Family History",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                "Past Treatment History",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Lab Test Reports",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
