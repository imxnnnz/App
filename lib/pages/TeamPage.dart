import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  List<TeamName>? teamname = [];
  bool isLoading = true;
  Future<void> _getData() async {
    var url = Uri.parse("https://noraphat.dev/web_api/get_team_name/");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //print(response.body);
      final Team team = Team.fromJson(convert.jsonDecode(response.body));
      setState(() {
        teamname = team.teamname;
        isLoading = false;
      });
    } else {
      print('error from backed ${response.statusCode}');
      isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Premier League Teams'),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(teamname![index].team_logo!),
                            fit: BoxFit.scaleDown)),
                  ),
                  onTap: () {
                    String? teamLatString = teamname![index].team_lat;
                    String? teamLongString = teamname![index].team_long;

                    if (teamLatString != null && teamLongString != null) {
                      double teamLat = double.parse(teamLatString);
                      double teamLong = double.parse(teamLongString);

                      print('teamLat: $teamLat, teamLong: $teamLong');

                      Navigator.pushNamed(context, 'homestack/mapteam',
                                  arguments: {
                                    'id': teamname![index].id,
                                    'teamname': teamname![index].team_name,
                                    'teamdetail': teamname![index].team_detail,
                                    'teamLat': teamname![index].team_lat,
                                    'teamLong': teamname![index].team_long,
                                  });
                    } else {
                      print('Error: teamLatString or teamLongString is null');
                    }
                  },
                  title: Text('${teamname![index].team_name}'),
                  trailing: Icon(Icons.arrow_right),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: teamname!.length),
    );
  }
}
