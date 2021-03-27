import 'package:bitbox_220_volts/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bmi_page.dart';
import 'covid_page.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFE91E63), Color(0xFFFF80AB)]),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Stack(
                      children: <Widget>[
                        Container(),
                        SvgPicture.asset(
                          "assets/new_nurse.svg",
                          width: 195,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.bottomLeft,
                        ),
                        Positioned(
                          top: 70,
                          left: 220,
                          child: Text(
                            ' Remote \n Application \n For Health \n Assistance And \n Tracking',
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CovidPage()));
                });
              },
              child: ScreenCardsRight(
                  imagePath: 'assets/new_virus_emoji.png',
                  message: 'Corona Virus Updates'),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMIPage()));
                  });
                },
                child: ScreenCardsLeft(
                    imagePath: 'assets/new_heart.png',
                    message: 'BMI Calculator')),
            SizedBox(height: 20.0),
            GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMIPage()));
                  });
                },
                child: ScreenCardsRight(
                    imagePath: 'assets/new_heart.png', message: 'Temperature')),
            SizedBox(height: 20.0),
            GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMIPage()));
                  });
                },
                child: ScreenCardsLeft(
                    imagePath: 'assets/new_heart.png', message: 'Heart Rate'))
          ],
        ),
      ),
    );
  }
}

class ScreenCardsRight extends StatelessWidget {
  final String imagePath;
  final String message;

  ScreenCardsRight({@required this.imagePath, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 390.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.pink.shade50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(
            image: AssetImage(imagePath),
          ),
          Divider(),
          Text(
            message,
            style: kTitleTextstyle.copyWith(color: Colors.pink),
          ),
        ],
      ),
    );
  }
}

class ScreenCardsLeft extends StatelessWidget {
  final String imagePath;
  final String message;

  ScreenCardsLeft({@required this.imagePath, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 390.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.pink.shade50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            message,
            style: kTitleTextstyle.copyWith(color: Colors.pink),
          ),
          Divider(),
          Image(
            image: AssetImage(imagePath),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
