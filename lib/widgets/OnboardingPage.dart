import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;

class OnboardingPage extends StatelessWidget {

  final String title;
  final String description;

  OnboardingPage(this.title, this.description);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.description),
          ),
        ),
      ),
    );
  }
}
