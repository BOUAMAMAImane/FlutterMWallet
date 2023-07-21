import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget defaultHomeButton({
  required String buttonText,
  required AssetImage buttonImage,
  required VoidCallback function,
}) =>
    InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      onTap: function,
      child: Ink(
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ImageIcon(buttonImage),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget loginButton({
  required String buttonText,
  required VoidCallback function,
}) =>
    MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: function,
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
      ),
    );

Widget ButtonTest({
  required VoidCallback function,
  required String text,
}) =>
    ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(0),
      ),
      child: Container(
        width: 170,
        height: 65,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Colors.green,
              Color(0xff1546A0),
            ],
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
