import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_abdm/finalscreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:http/http.dart' as http;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MainHospital extends StatefulWidget {
  const MainHospital({Key? key}) : super(key: key);

  @override
  State<MainHospital> createState() => _MainHospitalState();
}

class _MainHospitalState extends State<MainHospital> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Uint8List? cameravalue;
  var valstr = {
    "qr_data":
        "shc:/1/1/5676295953265460346029254077280433602870286471674522280928614129546321673677557044633326532658763326372355274136394033334061457337775575404337714464452339404543366329383240246031222909524320603460292437404460573601064529313900327425284350226967700310740368266705253037083124446111556058316377657161277628103055632831760610654331426036582140697327331110732408655032243058376666287275230304371027521027210024093943640359652874300706032936456121305229076110276826085612402728067770403461440841310733677456336135560335392734644332443342616032694539074338615268554136714445382012716460612473676842330061612975670376635060770974403632501161307376292250315857535264383375002026315024090844576136435370201229673942092730273821060433295459090373732652212250773940642263110310757300662311037733052774442230320372362708084403356836107164672476762350722810067675754224754154300567503038291041447277526345427010682452546956394133126572530642114459606160244129545734223050032260624121447343297054672672410652535844371160647235353640503909436572503145587062413653382727217730365237316854581039527068583576292854395366034330055074643876246208002739244552004134416140684323297136614175656423356440373261693563680330733744290850316008225552122430575027305941042566206240367144715021103564403861396861076242271231587343606874653400422260123674012724287124342469096104323507683230534310404538660708062044680609355337757171373774774428580608436856526477736969043006535333056537746332125560274026754063086633713855212974"
  };

  Future qrcodescanner() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      String? qrdata = await scanner.scan();
      print(qrdata);


      getResponse();
       getverified();
    } else {
      var isGrant = await Permission.camera.request();

      if (isGrant.isGranted) {
        String? qrData = await scanner.scan();
        print(qrData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var apijson = {
      "entry": [
        {
          "fullUrl": "resource:0",
          "resource": {
            "birthDate": "1951-01-20",
            "name": [
              {
                "family": "Anyperson",
                "given": ["John", "B."]
              }
            ],
            "resourceType": "Patient"
          }
        },
        {
          "fullUrl": "resource:1",
          "resource": {
            "lotNumber": "0000001",
            "occurrenceDateTime": "2021-01-01",
            "patient": {"reference": "resource:0"},
            "performer": [
              {
                "actor": {"display": "ABC General Hospital"}
              }
            ],
            "resourceType": "Immunization",
            "status": "completed",
            "vaccineCode": {
              "coding": [
                {"code": "207", "system": "http://hl7.org/fhir/sid/cvx"}
              ]
            }
          }
        },
        {
          "fullUrl": "resource:2",
          "resource": {
            "lotNumber": "0000007",
            "occurrenceDateTime": "2021-01-29",
            "patient": {"reference": "resource:0"},
            "performer": [
              {
                "actor": {"display": "ABC General Hospital"}
              }
            ],
            "resourceType": "Immunization",
            "status": "completed",
            "vaccineCode": {
              "coding": [
                {"code": "207", "system": "http://hl7.org/fhir/sid/cvx"}
              ]
            }
          }
        }
      ],
      "resourceType": "Bundle",
      "type": "collection"
    };
    var apijson1 = apijson.values.toList();
    print(apijson1[0]);
    var hosjson = {
      'patients': {
        'Demographics': {
          'name': 'ABC',
          'gender': 'male',
          'birthDate': '1981-01-12'
        },
        'clinicalData': {
          'FamilyHistory': [
            {'display': 'Father diagnosed with prostate cancer at age of 65'}
          ],
          'Procedures': [
            {'display': 'Assessment of diabetic foot ulcer'}
          ],
          'Allergies': [],
          'Medication': [
            {'display': 'Telmisartan 20 mg oral tablet'}
          ]
        },
        'meta': {
          'versionId': '1',
          'lastUpdated': '2020-07-09T15:32:26.605+05:30',
          'profile': [
            'https://nrces.in/ndhm/fhir/r4/StructureDefinition/DocumentBundle'
          ],
          'security': [
            {
              'system':
                  'http://terminology.hl7.org/CodeSystem/v3-Confidentiality',
              'code': 'V',
              'display': 'very restricted'
            }
          ]
        },
        'patientID': '22-7225-4829-5255'
      }
    };
    var horjson1 = hosjson["patients"];
    var horjson2 = horjson1 as Map;
    print(horjson2["Demographics"]);
    var horjson3 = horjson2 ;
    print(horjson3["gender"]);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 12),
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
                    width: 130,
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
                height: 250,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    qrcodescanner();
                  },
                  child: Container(
                    width: 160,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: Text(
                      "Scan",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xff239a23),
                        borderRadius: BorderRadius.circular(17)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildQRView(BuildContext context) {
  //   return QRView(
  //     key: qrKey,
  //     onQRViewCreated: onQrViewCreated,
  //     overlay: QrScannerOverlayShape(),
  //   );
  // }

  // void onQrViewCreated(QRViewController controller) {
  //   setState(() {
  //     this.controller = controller;
  //   });
  // }

  getResponse() async {
    String url = "https://qr-scanner-decode.herokuapp.com/decode";
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(valstr),
        headers: {"Content-type": "application/json"});

    if (response.statusCode == 200) {

      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FinalScreen()));
      print(response.body);
      var netval = response.body;
      print(netval[1]);
    } else {
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FinalScreen()));
      print(response.body);
      var netval = response.body;
      print(netval[1]);
      print("something went wrong");
    }
  }

  getverified() async {
    String url = "https://qr-scanner-decode.herokuapp.com/verification";
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(valstr),
        headers: {"Content-type": "application/json"});

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Verification"),
          content: const Text("Verification success"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: const Text("okay"),
              ),
            ),
          ],
        ),
      );
      getResponse();
      var netval = response.body;
      print(netval[1]);
    } else {
      print("something went wrong");
    }
  }
}
