import 'package:covid/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildHeader(String heading, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(12.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: GoogleFonts.notoSans(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: kHeadingColor,
          ),
        ),
        InkWell(
          child: Icon(icon, color: kHeadingColor,),
          onTap: () {
          },
        )
      ],
    ),
  );
}