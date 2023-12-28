class Team {
  List<TeamName>? teamname;

  Team({this.teamname});

  Team.fromJson(Map<String, dynamic> json) {
    if (json['TeamName'] != null) {
      teamname = <TeamName>[];
      json['TeamName'].forEach((v) {
        teamname!.add(new TeamName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teamname != null) {
      data['TeamName'] = this.teamname!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamName {
  String? id;
  String? team_name;
  String? team_detail;
  String? team_lat;
  String? team_long;
  String? team_logo;

  TeamName(
      {this.id,
      this.team_name,
      this.team_detail,
      this.team_lat,
      this.team_long,
      this.team_logo});

  TeamName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    team_name = json['team_name'];
    team_detail = json['team_detail'];
    team_lat = json['team_lat'];
    team_long = json['team_long'];
    team_logo = json['team_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['team_name'] = this.team_name;
    data['team_detail'] = this.team_detail;
    data['team_lat'] = this.team_lat;
    data['team_long'] = this.team_long;
    data['team_logo'] = this.team_logo;
    return data;
  }
}
