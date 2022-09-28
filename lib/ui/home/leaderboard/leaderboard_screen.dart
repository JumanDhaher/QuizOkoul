import 'package:flutter/material.dart';
import '../../../api/score_api.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  var first = true;

  late Future<List<dynamic>> future;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (first) {
      future = ScoreApi().getTopScore();
      first = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Leaderboard',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
          FutureBuilder<List<dynamic>>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      primary: true,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data![i]['name']!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(snapshot.data![i]['score']!.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200)),
                              ]),
                        );
                      });
                } else {
                  print(snapshot.error);
                }
                return Container();
              }),
        ],
      ),
    );
  }
}
