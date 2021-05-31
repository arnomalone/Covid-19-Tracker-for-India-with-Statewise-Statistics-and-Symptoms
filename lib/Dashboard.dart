import 'package:covid/Statewise.dart';
import 'package:covid/constants.dart';
import 'package:covid/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

import 'More.dart';
import 'buildHeader.dart';

class Dashboard extends StatefulWidget {
  static const String screenID = 'dashboard_screen_id';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  Data covidData = Data();
  Map _data;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

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
        body: StreamBuilder(
            stream: _getStats(Duration(seconds: kReloadDuration)),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _data = snapshot.data;
                print('///////////////////// DATA ///////////////////');
                print(snapshot.data['statewise'][0]['active']);
                // return _data['statewise'][codeIndex][display].toString();
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image(image: AssetImage('assets/india.jpg')),
                      buildHeader('Overall Statistics', Icons.thermostat_sharp),
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
                      buildHeader('Filter Statistics', Icons.filter_vintage_outlined),
                      Container(
                        height: 200.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildStatsItem('india', 'India', '9999'),
                            _buildStatsItem('delhi', 'Delhi', '999'),
                            _buildStatsItem(
                                'maharashtra', 'Maharashtra', '999'),
                            _buildStatsItem('more', 'See more', ''),
                            SizedBox(
                              width: 14.0,
                            )
                          ],
                        ),
                      ),
                      buildHeader(
                          'Symptoms of COVID', Icons.scatter_plot_outlined),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.5),
                        child: TabBar(
                          controller: tabController,
                          isScrollable: true,
                          indicatorColor: Colors.transparent,
                          labelColor: kHeadingColor,
                          unselectedLabelColor: kBoxColor,
                          //Colors.grey.withOpacity(0.5),
                          labelStyle: GoogleFonts.notoSans(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                          unselectedLabelStyle: GoogleFonts.notoSans(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                          tabs: [
                            Tab(
                              child: Text('Mild (3)'),
                            ),
                            Tab(
                              child: Text('Moderate (8)'),
                            ),
                            Tab(
                              child: Text('Serious (3)'),
                            ),
                            // Tab(child: Text('DISCOUNTED'),),
                            // Tab(child: Text('GOOD OLD'),),
                          ],
                        ),
                      ),
                      Container(
                        height: 180.0,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildSymptomsItem('common', 'fever'),
                                  _buildSymptomsItem('common', 'dry cough'),
                                  _buildSymptomsItem('common', 'tiredness'),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildSymptomsItem(
                                      'less_common', 'aches and pains'),
                                  _buildSymptomsItem(
                                      'less_common', 'sore throat'),
                                  _buildSymptomsItem(
                                      'less_common', 'diarrhoea'),
                                  _buildSymptomsItem(
                                      'less_common', 'conjunctivitis'),
                                  _buildSymptomsItem('less_common', 'headache'),
                                  _buildSymptomsItem(
                                      'less_common', 'loss of taste or smell'),
                                  _buildSymptomsItem(
                                      'less_common', 'a rash on skin'),
                                  _buildSymptomsItem('less_common',
                                      'discolouration of fingers or toes'),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildSymptomsItem(
                                      'serious', 'loss of speech or movement'),
                                  _buildSymptomsItem(
                                      'serious', 'chest pain or pressure'),
                                  _buildSymptomsItem('serious',
                                      'difficulty breathing or shortness of breath'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.5),
                        child: Container(
                          height: 20.5,
                          child: Marquee(
                            text:
                                'Stay safe at home and don\'t leave unless it\'s necessary // People with mild symptoms who are otherwise healthy should manage their symptoms at home // On average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days // Seek immediate medical attention if you have serious symptoms. // Always call before visiting your doctor or health facility // All the icons used in this app were taken from icons8.com // The data is reloaded after every $kReloadDuration seconds // ',
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w600,
                                color: kHeadingColor),
                            // scrollAxis: Axis.horizontal,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // blankSpace: 20.0,
                            // velocity: 100.0,
                            // pauseAfterRound: Duration(seconds: 1),
                            // startPadding: 10.0,
                            // accelerationDuration: Duration(seconds: 1),
                            // accelerationCurve: Curves.linear,
                            // decelerationDuration: Duration(milliseconds: 500),
                            // decelerationCurve: Curves.easeOut,
                          ),
                        ),
                      ),
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
      ),
    );
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
                // 'N/A',
                _getData('India', display),
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

  Padding _buildStatsItem(String img, String state, String count) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          if (state == 'See more')
            Navigator.pushNamed(context, More.screenID);
          else
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Statewise(
                      state_name: state,
                    )));
        },
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
                state,
                style: GoogleFonts.notoSans(
                    fontSize: 17.0,
                    color: kHeadingColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                // count,
                _getData(state, 'active'),
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

  Padding _buildSymptomsItem(String img, String status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.5, vertical: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 50.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: kBoxColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                status,
                style: GoogleFonts.notoSans(
                    fontSize: 17.0,
                    color: kHeadingColor,
                    fontWeight: FontWeight.w500),
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
