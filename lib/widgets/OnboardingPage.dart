import 'package:flutter/material.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;
import 'package:sport_predictor/widgets/CircleWidget.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final BoxDecoration background;

  OnboardingPage(this.title, this.description, this.background);

  Widget build(BuildContext context) {
    return Container(
        decoration: background,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional(0, 0),
                children: <Widget>[
                  CustomPaint(painter: CircleWidget(AppTheme.Colors.purple_f8)),
                  Image.asset('assets/soccer_ball.png', width: 60, height: 60,
                  ),
                ]
              ),
              Column(children: <Widget>[
                Text(
                  this.title.toString(),
                  style: new TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  this.description.toString(),
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400
                    ),
                ),
              ])
            ]));
  }
}
