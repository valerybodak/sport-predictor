import 'package:flutter/material.dart';
import 'package:sport_predictor/model/League.dart';
import 'package:sport_predictor/widgets/EventsWidget.dart';
import 'package:sport_predictor/widgets/StandingsWidget.dart';

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
//#FD4B93
  Widget _getBody(){
    return Container(
      // Add box decoration
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            const Color(0xff6C50F3),
            const Color(0xffE65BB5),
          ],
        ),
      ),
      child: Center(
        child: new Text('Standings'),
      ),
    );

  }
}