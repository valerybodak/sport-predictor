import 'package:flutter/material.dart';

import 'package:sport_predictor/blocks/standings_bloc.dart';
import 'package:sport_predictor/model/StandingsResponse.dart';
import 'package:sport_predictor/model/StandingsTeam.dart';

class StandingsWidget extends StatefulWidget {
  final String leagueId;

  StandingsWidget(this.leagueId);

  @override
  StandingsState createState() => StandingsState(this.leagueId);
}

class StandingsState extends State<StandingsWidget> {
  final bloc = StandingsBloc();

  final String leagueId;

  StandingsState(this.leagueId);

  @override
  void initState() {
    super.initState();
    bloc.getStandings(this.leagueId);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getListViewStandings();
  }

  Widget getProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getListViewStandings() {
    return StreamBuilder(
      stream: bloc.standings,
      initialData: bloc.initialData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          StandingsResponse response = snapshot.data;

          if(response.isError()) {

            return getErrorWidget(response.errorMessage);

          }else {
            return ListView.builder(
                itemCount: response.standings.length,
                itemBuilder: (BuildContext context, int index) {
                  StandingsTeam team = response.standings[index];

                  var topPadding = index == 0 ? 16.0 : 8.0;
                  var bottomPadding = index == response.standings.length - 1 ? 16.0 : 8.0;

                  return Padding(
                      padding: EdgeInsets.only(left: 16.0,
                          top: topPadding,
                          right: 16.0,
                          bottom: bottomPadding),
                      child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    child: Row(children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0),
                                        child: SizedBox(
                                            width: 20,
                                            child: Text(
                                              team.overall_league_position
                                                  .toString(),
                                              style: new TextStyle(
                                                  fontSize: 14.0),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0),
                                        child: Text(
                                          team.team_name,
                                          style: new TextStyle(fontSize: 14.0),
                                        ),
                                      ),
                                    ])),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    team.overall_league_PTS,
                                    style: new TextStyle(fontSize: 14.0),
                                  ),
                                )
                              ])));
                });
          }
        }
      },
    );
  }

  Widget getErrorWidget(String error){
    return Center(
      child: Text(
        error,
        style: new TextStyle(fontSize: 16.0),
      ),
    );
  }
}
