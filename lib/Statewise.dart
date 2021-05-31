import 'package:covid/buildHeader.dart';
import 'package:covid/constants.dart';
import 'package:covid/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Statewise extends StatefulWidget {
  final state_name;

  Statewise({this.state_name});

  static const String screenID = 'statewise_screen_id';

  @override
  _StatewiseState createState() => _StatewiseState();
}

class _StatewiseState extends State<Statewise> {
  Data covidData = Data();
  Map _data;

  _getStats(Duration refreshTime) async* {
    while (true) {
      yield await _reload();
      await Future.delayed(refreshTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: StreamBuilder<Object>(
          stream: _getStats(Duration(seconds: kReloadDuration)),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _data = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.5),
                      child: Text(
                        widget.state_name,
                        style: GoogleFonts.notoSans(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: kHeadingColor),
                      ),
                    ),
                    buildHeader('Overall Statistics', Icons.thermostat_outlined),
                    Container(
                      height: 200.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildListItem(
                              'purple', 'Confirmed', '999', 'confirmed'),
                          _buildListItem(
                              'green', 'Recovered', '999', 'recovered'),
                          _buildListItem('yellow', 'Active', '999', 'active'),
                          _buildListItem('red', 'Deaths', '99', 'deaths'),
                          SizedBox(
                            width: 14.0,
                          )
                        ],
                      ),
                    ),
                    buildHeader('Daily Statistics', Icons.history_outlined),
                    Container(
                      height: 200.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildListItem(
                              'purple', 'Confirmed', '999', 'deltaconfirmed'),
                          _buildListItem(
                              'green', 'Recovered', '999', 'deltarecovered'),
                          _buildListItem('red', 'Deaths', '99', 'deltadeaths'),
                          SizedBox(
                            width: 14.0,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: kBoxColor,
                ),
              );
            }
          }),
    ));
  }

  Padding _buildListItem(
      String img, String status, String count, String display) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: kBoxColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'null',
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: kIconBackGround,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/$img.png',
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                status,
                style: GoogleFonts.notoSans(
                    fontSize: 17.0,
                    color: kHeadingColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                // count,
                _getData(widget.state_name, display),
                style: GoogleFonts.notoSans(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getData(String state, String display) {
    if (state == 'See more') {
      return '';
    }
    int codeIndex = kCodes[state];
    // print('*****');
    // print(display);
    // print(codeIndex);
    // print('*****');
    final String x = _data['statewise'][codeIndex][display].toString();
    return x;
    // return _data;
  }

  _reload() async {
    await covidData.updateData();
    return covidData.data;
  }
}
