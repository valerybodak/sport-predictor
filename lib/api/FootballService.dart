import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sport_predictor/api/RequestParams.dart';
import 'package:sport_predictor/model/StandingsResponse.dart';
import 'package:sport_predictor/model/EventsResponse.dart';
import 'package:sport_predictor/api/ApiConsts.dart';

abstract class FootballServiceInterface {
  Future<StandingsResponse> getStandings(String leagueId);
  Future<EventsResponse> getEvents(String leagueId);
}

class FootballService implements FootballServiceInterface {

  static const HTTP_OK = 200;

  Future<StandingsResponse> getStandings(String leagueId) async {

    var requestParams = RequestParams();
    requestParams.addPathParam("action", "get_standings");
    requestParams.addPathParam("league_id", leagueId.toString());

    var url = _composeUrl(requestParams);

    return await http
        .get(Uri.encodeFull(url))
        .then((http.Response response) {
      final int statusCode = response.statusCode;
      final responseBody = json.decode(response.body);
      if (statusCode == HTTP_OK) {
        if (responseBody is List) {
          return StandingsResponse.fromJson(responseBody);
        } else {
          return StandingsResponse.parseErrorResponse(responseBody);
        }
      }
      return null;
    });
  }

  Future<EventsResponse> getEvents(String leagueId) async {

    var requestParams = RequestParams();
    requestParams.addPathParam("action", "get_events");
    requestParams.addPathParam("league_id", leagueId.toString());

    DateTime oneDayAgo = DateTime.now().subtract(new Duration(days: 20));
    DateTime thirtyDayFromNow = DateTime.now().add(new Duration(days: 31));

    var formatter = new DateFormat('yyyy-MM-dd');

    requestParams.addPathParam("from", formatter.format(oneDayAgo));
    requestParams.addPathParam("to", formatter.format(thirtyDayFromNow));

    var url = _composeUrl(requestParams);

    return await http
        .get(Uri.encodeFull(url))
        .then((http.Response response) {
      final int statusCode = response.statusCode;
      final responseBody = json.decode(response.body);
      if (statusCode == HTTP_OK) {
        if (responseBody is List) {
          return EventsResponse.fromJson(responseBody);
        } else {
          return EventsResponse.parseErrorResponse(responseBody);
        }
      }
      return null;
    });
  }

  String _composeUrl(RequestParams params){

    var url = ApiConsts.API_FOOTBALL_ENDPOINT;

    if(params!=null) {

      var i = 0;
      params.pathParams.forEach((k, v) {
        if (i == 0) {
          url = url + "?";
        } else {
          url = url + "&";
        }
        url = url + k + "=" + v;
        i++;
      });

      url = url + "&APIkey=" + ApiConsts.API_FOOTBALL_KEY;

    }
    return url;
  }


}