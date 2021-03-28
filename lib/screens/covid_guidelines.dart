import 'package:bitbox_220_volts/constants.dart';
import 'package:flutter/material.dart';

class CovidGuidelinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColour,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/red_banner_covid.jpg')),
            Center(
              child: Container(
                width: double.infinity,
                height: 40.0,
                color: Colors.deepOrange[50],
                child: Center(
                  child: Text(
                    '"Prevention is better than cure"',
                    style: kSubTextStyle.copyWith(
                        color: Colors.red[700],
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            GuideCardRight(
                message: 'Wear Masks', imagePath: 'assets/pink_mask.png'),
            SizedBox(height: 10.0),
            GuideCardLeft(
                message: 'Wash Hands With Soap',
                imagePath: 'assets/washing_hands.png'),
            SizedBox(height: 10.0),
            GuideCardRight(
                message: 'Stay Home', imagePath: 'assets/stay_home.png'),
            SizedBox(height: 10.0),
            GuideCardLeft(
                message: 'Social Distancing',
                imagePath: 'assets/social_distance.png'),
            SizedBox(height: 10.0),
            GuideCardRight(
                message: 'Clean & Disinfect', imagePath: 'assets/clean.png'),
            SizedBox(height: 10.0),
            GuideCardLeft(
                message: 'Get Vaccinated', imagePath: 'assets/vaccine.png'),
            SizedBox(height: 10.0),
            GuideCardRight(
                message: 'Monitor Health Daily',
                imagePath: 'assets/health_daily.png'),
            SizedBox(height: 10.0),
            GuideCardLeft(
                message: 'Cover Coughs & Sneezes',
                imagePath: 'assets/napkin.png'),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}

class GuideCardRight extends StatelessWidget {
  GuideCardRight({@required this.message, @required this.imagePath});

  final String message;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(width: 20.0),
        Container(
          width: 250.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              message,
              style:
                  kTitleTextstyle.copyWith(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class GuideCardLeft extends StatelessWidget {
  GuideCardLeft({@required this.message, @required this.imagePath});

  final String message;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              message,
              style:
                  kTitleTextstyle.copyWith(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: 20.0),
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage(imagePath),
        ),
      ],
    );
  }
}
