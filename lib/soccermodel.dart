class SoccerMatch {
  Fixture fixture;
  Team home;
  Team away;
  Goal goal;

  SoccerMatch(
      {required this.fixture,
      required this.home,
      required this.away,
      required this.goal});

  factory SoccerMatch.fromJson(Map<String, dynamic> json) {
    return SoccerMatch(
      fixture: Fixture.fromJson(json['fixture']),
      home: Team.fromJson(json['teams']['home']),
      away: Team.fromJson(json['teams']['away']),
      goal: Goal.fromJson(json['goals']),
    );
  }
}

class Fixture {
  int id;
  String date;
  Status status;

  Fixture({required this.id, required this.date, required this.status});

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
        id: json['id'],
        date: json['date'],
        status: Status.fromJson(json['status']));
  }
}

class Status {
  int elapsedTime;
  String long;
  Status({required this.elapsedTime, required this.long});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(elapsedTime: json['elapsed'], long: json['long']);
  }
}

class Team {
  int id;
  String name;
  String logoUrl;
  bool winner;
  Team(
      {required this.id,
      required this.logoUrl,
      required this.name,
      required this.winner});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        id: json['id'],
        logoUrl: json['logo'],
        name: json['name'],
        winner: json['winner']);
  }
}

class Goal {
  int home;
  int away;

  Goal({required this.home, required this.away});

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(home: json['home'], away: json['away']);
  }
}
