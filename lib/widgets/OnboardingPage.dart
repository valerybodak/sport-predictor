import 'package:flutter/material.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;
import 'package:sport_predictor/consts/CommonConsts.dart';
import 'package:sport_predictor/screens/LeaguesListScreen.dart';

class OnboardingPage extends StatelessWidget {

  final String title;
  final String description;
  final BoxDecoration background;
  final String iconPath;
  final Color iconBackgroundColor;
  final bool lastPage;

  OnboardingPage(this.title,
      this.description,
      this.background,
      this.iconPath,
      this.iconBackgroundColor,
      this.lastPage);

  Widget build(BuildContext context) {

    return Container(
        decoration: background,
        child:
          Stack(alignment: AlignmentDirectional(0, 0), children: <Widget>[
            Column(
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
              ]
          ),
          getButtonOkWidget(context)
          ])
    );
  }

  Widget getButtonOkWidget(BuildContext context){
    if(this.lastPage) {
      return Positioned(
        bottom: 0.0,
        right: 0.0,
        child:
          GestureDetector(
            onTap: () {
              _onClickOK(context);
            },
            child: new Container(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            alignment: Alignment.center,
            height: CommonConsts.ONBOARDING_BOTTOM_CONTAINER_HEIGHT,
            child: Text(
              "OK",
              style: AppTheme.TextStyles.onboardingButtonOK,
            ),
          )
        )
      );
    }else{
      return Container();
    }
  }

  _onClickOK(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeaguesListScreen(),
      ),
    );
  }
}
