import 'package:rxdart/rxdart.dart';
import 'package:sport_predictor/api/FootballService.dart';
import 'package:sport_predictor/model/EventsResponse.dart';
import 'dart:async';

class EventsBloc {

  final eventsController = PublishSubject();

  Stream get events => eventsController.stream;
  EventsResponse initialData;

  void getEvents(String leagueId) async {
    FootballService service = FootballService();
    EventsResponse response = await service.getEvents(leagueId);
    if(response!=null){
      eventsController.sink.add(response);
    }
  }

  void dispose() {
    eventsController.close();
  }
}