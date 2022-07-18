import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

class TextandSwitch extends StatefulWidget {
  final String text;
  TextandSwitch({
    required this.text,
  });

  @override
  State<TextandSwitch> createState() => _TextandSwitchState();
}

class _TextandSwitchState extends State<TextandSwitch> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        FlutterSwitch(
            width: 60,
            activeColor: Color(0xff34c759),
            value: status,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            })
      ],
    );
  }
}
