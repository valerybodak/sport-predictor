import 'package:flutter/material.dart';
import 'package:sport_predictor/screens/LeagueScreen.dart';
import 'package:sport_predictor/screens/LeaguesListScreen.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of app application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppTheme.Colors.purple_e6,
      ),
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => LeaguesListScreen(),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/leagueScreen': (context) => LeagueScreen(league: null),
      },
    );
  }
}
