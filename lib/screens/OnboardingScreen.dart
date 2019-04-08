import 'package:flutter/material.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;
import 'package:sport_predictor/consts/CommonConsts.dart';
import 'package:sport_predictor/widgets/DotsIndicator.dart';
import 'package:sport_predictor/widgets/OnboardingPage.dart';

class OnboardingScreen extends StatefulWidget {

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final _pageController = new PageController();
  final _kArrowColor = Colors.black.withOpacity(0.8);

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  int currentPageIndex = 0;

  final List<Widget> _pages = <Widget>[
    OnboardingPage("Matches",
        "All Soccer Scores & Live Results",
        AppTheme.Decorations.purpleGradient, 'assets/ic_soccer_ball.png',
        AppTheme.Colors.purple_f8,
        false),

    OnboardingPage("Standings",
        "All Soccer Scores & Live Results",
        AppTheme.Decorations.nelsonGradient, 'assets/ic_trophy.png',
        AppTheme.Colors.yellow_34,
        false),

    OnboardingPage("Odds",
        "All Soccer Scores & Live Results",
        AppTheme.Decorations.reefGradient, 'assets/ic_bet.png',
        AppTheme.Colors.lime,
        true),
  ];

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              itemCount: _pages.length,
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index];
              },
            ),
            new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                height: CommonConsts.ONBOARDING_BOTTOM_CONTAINER_HEIGHT,
                child: new Center(
                  child: new DotsIndicator(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageSelected: (int index) {

                      currentPageIndex = index;

                      _pageController.animateToPage(
                        index,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}