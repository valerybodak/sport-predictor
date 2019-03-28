import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sport_predictor/blocks/events_bloc.dart';
import 'package:sport_predictor/model/EventsResponse.dart';
import 'package:sport_predictor/model/FootballMatch.dart';

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
                    return Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 4.0, right: 16.0, bottom: 4.0),
                        child: Column(
                            children: <Widget>[
                              getTeamScoreWidget(item.match.match_hometeam_name,
                                  item.match.match_hometeam_score),
                              getTeamScoreWidget(item.match.match_awayteam_name,
                                  item.match.match_awayteam_score),
                              getDividerWidget(item),
                            ]
                        )
                    );
                  }
                });
          }
        }
      },
    );
  }

  Widget getDateHeaderWidget(String date){
    return Container(
      color: const Color(0xffD0D0D0),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
        child: Text(
          new DateFormat.yMMMd().format(DateTime.parse(date)),
          style: new TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ),
    );
  }

  Widget getTeamScoreWidget(String teamName, String score){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            teamName,
            style: new TextStyle(fontSize: 15.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              score,
              style: new TextStyle(fontSize: 15.0),
            ),
          ),
        ]
    );
  }

  Widget getDividerWidget(MatchItem item){
    if(item.isLastForDate){
      return Container(
        height: 0.0,
      );
    }else {
      return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: 1.0,
            color: const Color(0xffD0D0D0),
          )
      );
    }
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
