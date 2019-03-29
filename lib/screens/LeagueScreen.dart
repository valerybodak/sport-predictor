import 'package:flutter/material.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;
import 'package:sport_predictor/model/League.dart';
import 'package:sport_predictor/widgets/EventsWidget.dart';
import 'package:sport_predictor/widgets/OddsWidget.dart';
import 'package:sport_predictor/widgets/StandingsWidget.dart';

class LeagueScreenArguments {
  final String title;
  final String message;

  LeagueScreenArguments(this.title, this.message);
}

class LeagueScreen extends StatefulWidget {

  final League league;

  LeagueScreen({Key key, @required this.league}) : super(key: key);

  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {

  int _currentIndexBottomBar = 0;

  @override
  Widget build(BuildContext context) {

    //final LeagueScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          title: Text(widget.league.league_name),
      ),

      body: Container(
        // Add box decoration
        decoration: AppTheme.Decorations.linearPurpleGradient,
        child: _getContentWidget(),
      ),

      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  Widget _getContentWidget(){
    return getWidgetByTab(_currentIndexBottomBar);

  }

  Widget _getBottomNavigationBar(){
    return BottomNavigationBar(
      onTap: onBottomTabTapped,
      currentIndex: _currentIndexBottomBar, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Matches'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.list),
          title: new Text('Standings'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.score),
          title: new Text('Odds'),
        ),
      ],
    );
  }

  void onBottomTabTapped(int index) {
    setState(() {
      _currentIndexBottomBar = index;
    });
  }

  Widget getWidgetByTab(int index){
    if(_currentIndexBottomBar==0) {
      return EventsWidget(widget.league.league_id);
    }else if(_currentIndexBottomBar==1){
      return StandingsWidget(widget.league.league_id);
    }else{
      return OddsWidget(widget.league.league_id);
    }

  }
}