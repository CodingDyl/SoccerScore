import 'package:flutter/material.dart';
import 'package:soccer_score/pagerbody.dart';
import 'package:soccer_score/soccermodel.dart';

import 'api_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  const SoccerApp({super.key});

  @override
  State<SoccerApp> createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Score", style: TextStyle(color: Colors.black)),
            SizedBox(
              width: 5,
            ),
            Text(
              "Check",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<SoccerMatch>>(
        future: SoccerApi().getAllMatches(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return PageBody(snapshot.data!);
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Image.asset(
                      "assets/salah_wait.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "No Current Matches are being played!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, color: Colors.black26),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
