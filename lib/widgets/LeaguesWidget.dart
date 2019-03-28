import 'package:flutter/material.dart';
import 'package:sport_predictor/api/LeaguesConst.dart';
import 'package:sport_predictor/model/League.dart';
import 'package:sport_predictor/screens/LeagueScreen.dart';

class LeaguesWidget extends StatefulWidget {

  LeaguesWidget();

  @override
  LeaguesState createState() => LeaguesState();
}

class LeaguesState extends State<LeaguesWidget> {

  List<League> leagues = List();

  LeaguesState();

  @override
  void initState() {
    super.initState();
    leagues = getLeagues();
  }

  @override
  Widget build(BuildContext context) {
    return getListLeaguesWidget();
  }

  List<League> getLeagues(){
    var leaguesList = List<League>();
    leaguesList.add(new League(LeaguesConst.CHAMPIONSHIP_ID, "Championship"));
    leaguesList.add(new League(LeaguesConst.LIGUE_2_ID, "Ligue 2"));
    return leaguesList;
  }

  Widget getListLeaguesWidget() {
    return ListView.builder(
        itemCount: leagues.length,
        itemBuilder: (BuildContext context, int index) {
          League league = leagues[index];

          return GestureDetector(
            child: getLeagueItemWidget(league),
            onTap: () => showLeague(league),
          );
        });
  }

  void showLeague(League league){

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeagueScreen(league: league),
      ),
    );
  }

  Widget getLeagueItemWidget(League league){
    return Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0, bottom: 12.0),
            child: Text(
              league.league_name,
              style: new TextStyle(fontSize: 16.0),
            )
    );
  }
}
