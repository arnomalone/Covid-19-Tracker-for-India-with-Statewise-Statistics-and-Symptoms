import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// const kBackgroundColor = Color(0xFFFFE9C6);
const kBackgroundColor = Color(0xFFfdfaf6);
const kBoxColor = Color(0xFFe4efe7);
const kIconBackGround = Colors.white;
const kHeadingColor = Color(0xFF064420);
const String kAPI = 'https://api.covid19india.org/data.json';
const int kReloadDuration = 100;
const Map<String, int> kCodes = {
'India' : 0,
'Andaman and Nicobar Islands' : 1,
'Andhra Pradesh' : 2,
'Arunachal Pradesh' : 3,
'Assam' : 4,
'Bihar' : 5,
'Chandigarh' : 6,
'Chhattisgarh' : 7,
'Dadra and Nagar Haveli and Daman and Diu' : 8,
'Delhi' : 9,
'Goa' : 10,
'Gujarat' : 11,
'Haryana' : 12,
'Himachal Pradesh' : 13,
'Jammu and Kashmir' : 14,
'Jharkhand' : 15,
'Karnataka' : 16,
'Kerala' : 17,
'Ladakh' : 18,
'Lakshadweep' : 19,
'Madhya Pradesh' : 20,
'Maharashtra' : 21,
'Manipur' : 22,
'Meghalaya' : 23,
'Mizoram' : 24,
'Nagaland' : 25,
'Odisha' : 26,
'Puducherry' : 27,
'Punjab' : 28,
'Rajasthan' : 29,
'Sikkim' : 30,
'State Unassigned' : 31,
'Tamil Nadu' : 32,
'Telangana' : 33,
'Tripura' : 34,
'Uttar Pradesh' : 35,
'Uttarakhand' : 36,
'West Bengal' : 37,
};