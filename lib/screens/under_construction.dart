import 'package:flutter/material.dart';

class UnderConstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Spacer(),
        Image(
          image: AssetImage('assets/construction_page.png'),
        ),
        Spacer(),
      ]),
    );
  }
}
