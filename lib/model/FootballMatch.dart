class FootballMatch{

  final String match_id;
  final String country_id;
  final String country_name;
  final String league_id;
  final String league_name;
  final String match_date;
  final String match_status;
  final String match_time;
  final String match_hometeam_name;
  final String match_hometeam_score;
  final String match_awayteam_name;
  final String match_awayteam_score;
  final String match_hometeam_halftime_score;
  final String match_awayteam_halftime_score;
  final String match_hometeam_extra_score;
  final String match_awayteam_extra_score;
  final String match_hometeam_penalty_score;
  final String match_awayteam_penalty_score;
  final String match_hometeam_system;
  final String match_awayteam_system;
  final String match_live;

  FootballMatch({this.match_id, this.country_id, this.country_name,
      this.league_id, this.league_name, this.match_date, this.match_status,
      this.match_time, this.match_hometeam_name, this.match_hometeam_score,
      this.match_awayteam_name, this.match_awayteam_score,
      this.match_hometeam_halftime_score, this.match_awayteam_halftime_score,
      this.match_hometeam_extra_score, this.match_awayteam_extra_score,
      this.match_hometeam_penalty_score, this.match_awayteam_penalty_score,
      this.match_hometeam_system, this.match_awayteam_system, this.match_live});

  factory FootballMatch.fromJson(Map<String, dynamic> parsedJson){

    return FootballMatch(
      match_id: parsedJson['match_id'],
      country_id: parsedJson['country_id'],
      country_name: parsedJson['country_name'],
      league_id: parsedJson['league_id'],
      league_name: parsedJson['league_name'],
      match_date: parsedJson['match_date'],
      match_status: parsedJson['match_status'],
      match_time: parsedJson['match_time'],
      match_hometeam_name: parsedJson['match_hometeam_name'],
      match_hometeam_score: parsedJson['match_hometeam_score'],
      match_awayteam_name: parsedJson['match_awayteam_name'],
      match_awayteam_score: parsedJson['match_awayteam_score'],
      match_hometeam_halftime_score: parsedJson['match_hometeam_halftime_score'],
      match_awayteam_halftime_score: parsedJson['match_awayteam_halftime_score'],
      match_hometeam_extra_score: parsedJson['match_hometeam_extra_score'],
      match_awayteam_extra_score: parsedJson['match_awayteam_extra_score'],
      match_hometeam_penalty_score: parsedJson['match_hometeam_penalty_score'],
      match_awayteam_penalty_score: parsedJson['match_awayteam_penalty_score'],
      match_hometeam_system: parsedJson['match_hometeam_system'],
      match_awayteam_system: parsedJson['match_awayteam_system'],
      match_live: parsedJson['match_live'],
    );
  }
}