import 'package:flutter/material.dart';
import 'package:sport_predictor/screens/LeagueScreen.dart';
import 'package:sport_predictor/screens/LeaguesListScreen.dart';
import 'package:sport_predictor/widgets/EventsWidget.dart';
import 'package:sport_predictor/widgets/StandingsWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
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
