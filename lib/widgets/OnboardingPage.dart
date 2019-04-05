import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;

class OnboardingPage extends StatelessWidget {

  final String title;
  final String description;
  final BoxDecoration background;


  OnboardingPage(this.title, this.description, this.background);

  Widget build(BuildContext context) {
    return Container(
              decoration: this.background,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(this.description),
              ),
    );
  }
}
