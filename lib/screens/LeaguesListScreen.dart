import 'package:flutter/material.dart';
import 'package:sport_predictor/widgets/LeaguesWidget.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class LeaguesListScreen extends StatelessWidget {
  //static const routeName = '/leaguesListScreen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Leagues"),
      ),
      body: LeaguesWidget(),
    );
  }
}