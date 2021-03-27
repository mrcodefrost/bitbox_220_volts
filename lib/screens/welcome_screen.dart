import 'package:bitbox_220_volts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                height: 300,
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
                          "assets/nurse.svg",
                          width: 225,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomLeft,
                        ),
                        Positioned(
                          top: 70,
                          left: 180,
                          child: Text(
                            'Remote Application \n For Health \n Assistance And \n Tracking',
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
            Container(
              color: Colors.black,
              height: 20.0,
              width: 20.0,
            ),
          ],
        ),
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
