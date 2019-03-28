import 'package:rxdart/rxdart.dart';
import 'package:sport_predictor/api/FootballService.dart';
import 'dart:async';
import 'package:sport_predictor/model/StandingsResponse.dart';

class StandingsBloc {

  final standingsController = PublishSubject();

  Stream get standings => standingsController.stream;
  StandingsResponse initialData;

  void getStandings(String leagueId) async {
    FootballService service = FootballService();
    StandingsResponse response = await service.getStandings(leagueId);
    if(response!=null){
      standingsController.sink.add(response);
    }
  }

  void dispose() {
    standingsController.close();
  }

}