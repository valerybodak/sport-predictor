import 'package:flutter/material.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final BoxDecoration background;
  final String iconPath;
  final Color iconBackgroundColor;

  OnboardingPage(this.title,
      this.description,
      this.background,
      this.iconPath,
      this.iconBackgroundColor);

  Widget build(BuildContext context) {
    return Container(
        decoration: background,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(alignment: AlignmentDirectional(0, 0), children: <Widget>[
                Container(
                    width: 110.0,
                    height: 110.0,
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
                Image.asset(this.iconPath, width: 70, height: 70),
              ]),
              Column(children: <Widget>[
                Text(
                  this.title.toString(),
                  style: AppTheme.TextStyles.onboardingPageTitle,
                ),
                Text(
                  this.description.toString(),
                  style: AppTheme.TextStyles.onboardingPageDescription,
                ),
              ])
            ]));
  }
}
