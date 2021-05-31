import 'package:covid/buildHeader.dart';
import 'package:covid/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Statewise.dart';

class More extends StatefulWidget {

  static const screenID = 'more_screen_id';

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select',
                    style: GoogleFonts.notoSans(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: kHeadingColor,
                    ),
                  ),
                  Icon(
                    Icons.add_chart,
                    size: 35.0,
                    color: kHeadingColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.5),
              child: Container(
                height: 500.0,
                child: ListView(
                  children: [
                    SizedBox(height: 12.5,),
                    _buildStatsItem('Andaman and Nicobar Islands', '999'),
                    _buildStatsItem('Andhra Pradesh', '999'),
                    _buildStatsItem('Arunachal Pradesh', '999'),
                    _buildStatsItem('Assam', '999'),
                    _buildStatsItem('Bihar', '999'),
                    _buildStatsItem('Chandigarh', '999'),
                    _buildStatsItem('Chhattisgarh', '999'),
                    _buildStatsItem('Dadra and Nagar Haveli and Daman and Diu', '999'),
                    _buildStatsItem('Delhi', '999'),
                    _buildStatsItem('Goa', '999'),
                    _buildStatsItem('Gujarat', '999'),
                    _buildStatsItem('Haryana', '999'),
                    _buildStatsItem('Himachal Pradesh', '999'),
                    _buildStatsItem('Jammu and Kashmir', '999'),
                    _buildStatsItem('Jharkhand', '999'),
                    _buildStatsItem('Karnataka', '999'),
                    _buildStatsItem('Kerala', '999'),
                    _buildStatsItem('Ladakh', '999'),
                    _buildStatsItem('Lakshadweep', '999'),
                    _buildStatsItem('Madhya Pradesh', '999'),
                    _buildStatsItem('Maharashtra', '999'),
                    _buildStatsItem('Manipur', '999'),
                    _buildStatsItem('Meghalaya', '999'),
                    _buildStatsItem('Mizoram', '999'),
                    _buildStatsItem('Nagaland', '999'),
                    _buildStatsItem('Odisha', '999'),
                    _buildStatsItem('Puducherry', '999'),
                    _buildStatsItem('Punjab', '999'),
                    _buildStatsItem('Rajasthan', '999'),
                    _buildStatsItem('Sikkim', '999'),
                    _buildStatsItem('Tamil Nadu', '999'),
                    _buildStatsItem('Telangana', '999'),
                    _buildStatsItem('Tripura', '999'),
                    _buildStatsItem('Uttar Pradesh', '999'),
                    _buildStatsItem('Uttarakhand', '999'),
                    _buildStatsItem('West Bengal', '999'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }

  Padding _buildStatsItem(String state, String count) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Statewise(state_name: state,)));
        },
        child: Container(
          height: 100.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: kBoxColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                state,
                style: GoogleFonts.notoSans(
                    fontSize: 15.0,
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
