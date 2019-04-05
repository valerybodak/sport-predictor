import 'package:flutter/material.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final BoxDecoration background;
  final String iconPath;
  final Color iconBackgroundColor;

  OnboardingPage(this.title, this.description, this.background, this
      .iconPath, this.iconBackgroundColor);

  Widget build(BuildContext context) {
    return Container(
        decoration: background,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(alignment: AlignmentDirectional(0, 0), children: <Widget>[
                Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: this.iconBackgroundColor,
                          blurRadius: 40.0, // has the effect of softening
                          // the shadow
                          spreadRadius: 10.0, // has the effect of extending
                          // the shadow
                        )
                      ],
                      shape: BoxShape.circle,
                      color: this.iconBackgroundColor,
                    )),
                Image.asset(this.iconPath, width: 60, height: 60),
              ]),
              Column(children: <Widget>[
                Text(
                  this.title.toString(),
                  style: new TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  this.description.toString(),
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
              ])
            ]));
  }
}
