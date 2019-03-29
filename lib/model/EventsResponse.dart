import 'package:sport_predictor/model/BaseResponse.dart';
import 'package:sport_predictor/model/FootballMatch.dart';

abstract class EventListItem {}

//Based on:
//https://flutter.dev/docs/cookbook/lists/mixed-list

class DateItem implements EventListItem {
  final String date;

  DateItem(this.date);
}

class MatchItem implements EventListItem {

  FootballMatch match;

  MatchItem(FootballMatch match){
    this.match = match;
  }
}

class EventsResponse extends BaseResponse{

  final List<EventListItem> events;

  EventsResponse({this.events}) : super.name('', '');

  factory EventsResponse.fromJson(List<dynamic> json) {

    List<FootballMatch> items = json.map((i)=>FootballMatch.fromJson(i)).toList();

    List<EventListItem> eventsList = List<EventListItem>();

    var currentDate;
    
    for( var i = 0 ; i < items.length; i++ ) {
      
      FootballMatch match = items[i];
      
      if(currentDate==null){
        currentDate = match.match_date;
        eventsList.add(DateItem(match.match_date));
        eventsList.add(MatchItem(match));
      
      }else{

        var matchItem = MatchItem(match);

        if(currentDate!=match.match_date){

          eventsList.add(DateItem(match.match_date));
          currentDate = match.match_date;
        }

        eventsList.add(matchItem);
      }      
    }

    return EventsResponse(
      events: eventsList,
    );
  }

  factory EventsResponse.parseErrorResponse(Map<String, dynamic> json) {
    EventsResponse response  = EventsResponse();
    response.errorCode = json['error'].toString();
    response.errorMessage = json['message'];
    return response;
  }
}