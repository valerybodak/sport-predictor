import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sport_predictor/blocks/events_bloc.dart';
import 'package:sport_predictor/model/EventsResponse.dart';
import 'package:sport_predictor/model/FootballMatch.dart';
import 'package:sport_predictor/AppTheme.dart' as AppTheme;

class EventsWidget extends StatefulWidget {
  final String leagueId;

  EventsWidget(this.leagueId);

  @override
  EventsState createState() => EventsState(this.leagueId);
}

class EventsState extends State<EventsWidget> {
  final bloc = EventsBloc();

  final String leagueId;

  EventsState(this.leagueId);

  @override
  void initState() {
    super.initState();
    bloc.getEvents(leagueId);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getListViewEvents();
  }

  Widget getProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getListViewEvents() {
    return StreamBuilder(
      stream: bloc.events,
      initialData: bloc.initialData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          EventsResponse eventsResponse = snapshot.data;

          if(eventsResponse.isError()){

            return getErrorWidget(eventsResponse.errorMessage);

          }else {
            return ListView.builder(
                itemCount: eventsResponse.events.length,
                itemBuilder: (BuildContext context, int index) {
                  EventListItem item = eventsResponse.events[index];

                  if (item is DateItem) {
                    return getDateHeaderWidget(item.date);
                  } else if (item is MatchItem) {
                    return getMatchItemWidget(item.match);
                  }
                });
          }
        }
      },
    );
  }

  Widget getDateHeaderWidget(String date){
    return Container(
      margin: const EdgeInsets.only(
          left: 32.0, top: 6.0, right: 16.0, bottom: 6.0),
      child: Text(
          new DateFormat.yMMMd().format(DateTime.parse(date)),
          style: AppTheme.TextStyles.listDate,
        ),
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

  Widget getMatchItemWidget(FootballMatch match) {

    final score = match.match_hometeam_score + " - " + match.match_awayteam_score;

    return Container(
        margin: const EdgeInsets.only(
            left: 16.0, top: 6.0, right: 16.0, bottom: 6.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(4.0),
        ),

        child: Container(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 8.0, right: 10.0, bottom: 12.0),
                child: Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              match.league_name,
                              style: AppTheme.TextStyles.leagueName,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Text(
                                match.match_time,
                                style: AppTheme.TextStyles.matchTime,
                              ),
                            ),
                          ]
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Flexible(child: Container(
                                alignment: Alignment.centerRight,
                                width: double.infinity,
                                child: Text(
                                match.match_hometeam_name,
                                style: AppTheme.TextStyles.teamName,
                              ),), flex: 1),
                              new Flexible(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 60.0,
                                  child: Text(
                                    score,
                                    style: AppTheme.TextStyles.score,
                                  ),
                                ),
                                flex: 1),
                              new Flexible(
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    match.match_awayteam_name,
                                      style: AppTheme.TextStyles.teamName,
                                  ),
                                ),
                                flex: 1),
                            ]
                        )
                      ),

                    ])
            )
        )
    );
  }
}
