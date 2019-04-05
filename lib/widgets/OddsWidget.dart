import 'package:flutter/material.dart';
import 'package:sport_predictor/AppTheme.dart' as Theme;

class OddsWidget extends StatefulWidget {

  final String leagueId;

  OddsWidget(this.leagueId);

  @override
  _OddsWidgetState createState() => _OddsWidgetState();
}

class _OddsWidgetState extends State<OddsWidget> {

  @override
  Widget build(BuildContext context) {

    //final LeagueScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(

      body: _getBody(),
    );
  }

  Widget _getBody(){
    return Container(
      // Add box decoration
      decoration: Theme.Decorations.purpleGradient,
      child: Center(
        child: new Text('Standings'),
      ),
    );

  }
}