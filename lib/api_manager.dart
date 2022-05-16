import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:soccer_score/soccermodel.dart';

class SoccerApi {
  final String apiUrl = "https://v3.football.api-sports.io/fixtures?live=all";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "559daac7c713995596f7a526e6635ff8",
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['reponse'];
      print("Api Service: ${body}");
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();
      return matches;
    } else {
      return List.empty();
    }
  }
}
