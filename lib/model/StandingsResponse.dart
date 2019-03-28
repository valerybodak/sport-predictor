import 'package:sport_predictor/model/BaseResponse.dart';
import 'package:sport_predictor/model/StandingsTeam.dart';

class StandingsResponse extends BaseResponse{
  final List<StandingsTeam> standings;

  StandingsResponse({this.standings}) : super.name('', '');

  factory StandingsResponse.fromJson(List<dynamic> json) {

    List<StandingsTeam> items = json.map((i)=>StandingsTeam.fromJson(i)).toList();

    items.sort((a, b) => a.overall_league_position.compareTo(b.overall_league_position));

    return StandingsResponse(
      standings: items,
    );
  }

  factory StandingsResponse.parseErrorResponse(Map<String, dynamic> json) {
    StandingsResponse response  = StandingsResponse();
    response.errorCode = json['error'].toString();
    response.errorMessage = json['message'];
    return response;
  }
}