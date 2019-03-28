class StandingsTeam{

  final String country_name;
  final String league_id;
  final String league_name;
  final String team_name;
  final int overall_league_position;
  final String overall_league_payed;
  final String overall_league_W;
  final String overall_league_D;
  final String overall_league_L;
  final String overall_league_GF;
  final String overall_league_GA;
  final String overall_league_PTS;
  final String home_league_position;
  final String home_league_payed;
  final String home_league_W;
  final String home_league_D;
  final String home_league_L;
  final String home_league_GF;
  final String home_league_GA;
  final String home_league_PTS;
  final String away_league_position;
  final String away_league_payed;
  final String away_league_W;
  final String away_league_D;
  final String away_league_L;
  final String away_league_GF;
  final String away_league_GA;
  final String away_league_PTS;

  StandingsTeam({this.country_name, this.league_id, this.league_name,
      this.team_name, this.overall_league_position, this.overall_league_payed,
      this.overall_league_W, this.overall_league_D, this.overall_league_L,
      this.overall_league_GF, this.overall_league_GA, this.overall_league_PTS,
      this.home_league_position, this.home_league_payed, this.home_league_W,
      this.home_league_D, this.home_league_L, this.home_league_GF,
      this.home_league_GA, this.home_league_PTS, this.away_league_position,
      this.away_league_payed, this.away_league_W, this.away_league_D,
      this.away_league_L, this.away_league_GF, this.away_league_GA,
      this.away_league_PTS});

  factory StandingsTeam.fromJson(Map<String, dynamic> parsedJson){

    return StandingsTeam(
      country_name: parsedJson['country_name'],
      league_id: parsedJson['league_id'],
      league_name: parsedJson['league_name'],
      team_name: parsedJson['team_name'],
      overall_league_position: int.parse(parsedJson['overall_league_position']),
      overall_league_payed: parsedJson['overall_league_payed'],
      overall_league_W: parsedJson['overall_league_W'],
      overall_league_D: parsedJson['overall_league_D'],
      overall_league_L: parsedJson['overall_league_L'],
      overall_league_GF: parsedJson['overall_league_GF'],
      overall_league_GA: parsedJson['overall_league_GA'],
      overall_league_PTS: parsedJson['overall_league_PTS'],
      home_league_position: parsedJson['home_league_position'],
      home_league_payed: parsedJson['home_league_payed'],
      home_league_W: parsedJson['home_league_W'],
      home_league_D: parsedJson['home_league_D'],
      home_league_L: parsedJson['home_league_L'],
      home_league_GF: parsedJson['home_league_GF'],
      home_league_GA: parsedJson['home_league_GA'],
      home_league_PTS: parsedJson['home_league_PTS'],
      away_league_position: parsedJson['away_league_position'],
      away_league_payed: parsedJson['away_league_payed'],
      away_league_W: parsedJson['away_league_W'],
      away_league_D: parsedJson['away_league_D'],
      away_league_L: parsedJson['away_league_L'],
      away_league_GF: parsedJson['away_league_GF'],
      away_league_GA: parsedJson['away_league_GA'],
      away_league_PTS: parsedJson['away_league_PTS'],
    );
  }
}