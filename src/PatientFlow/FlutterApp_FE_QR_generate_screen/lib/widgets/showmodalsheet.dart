import 'dart:convert';
import 'dart:typed_data';

import 'package:abdm_project/screens/finalscreen.dart';
import 'package:abdm_project/widgets/BlueCardWidgeet.dart';
import 'package:abdm_project/widgets/textandswitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'bluecardwidget.dart';

class BottomSheetOkBro extends StatefulWidget {
  const BottomSheetOkBro({Key? key}) : super(key: key);

  @override
  State<BottomSheetOkBro> createState() => _BottomSheetOkBroState();
}

class _BottomSheetOkBroState extends State<BottomSheetOkBro> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.80,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 14, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                  color: Colors.grey.withOpacity(0.4),
                  thickness: 3,
                  endIndent: 100,
                  indent: 100),
              SizedBox(
                height: 10,
              ),
              BlueCardWidget(),
              SizedBox(
                height: 40,
              ),
              TextandSwitch(
                text: "current Medication",
              ),
              SizedBox(
                height: 10,
              ),
              TextandSwitch(
                text: "Allergies",
              ),
              SizedBox(
                height: 10,
              ),
              TextandSwitch(
                text: "Family history",
              ),
              SizedBox(
                height: 10,
              ),
              TextandSwitch(
                text: "Past treatment history",
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await getQRCode(context);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 160,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: isLoading
                        ? Center(
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            "Generate",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                    decoration: BoxDecoration(
                        color: Color(0Xff042c50),
                        borderRadius: BorderRadius.circular(17)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

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
        headers: {"Content-type": "image/png"}, );

    try {
      print(response.statusCode);
      if (response.statusCode == 200) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FinalScreen(
                  image: image!,
                )));
        setState(() {
          isLoading = false;
        });
        print(response.body);
        print("doneeeeee");
        var responsefinal = response.bodyBytes;
        print(responsefinal.runtimeType);

        setState(() {
          image = responsefinal;
          print(image);
        });

        // getfinalQr();
      } else {
        print("something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
