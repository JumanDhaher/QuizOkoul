import 'package:flutter/material.dart';
import '../../../api/score_api.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  var first = true;

  var future;

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
    return FutureBuilder<List<dynamic>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  print(snapshot.data![i]['name']!);
                  return ListTile(
                    title: Text(snapshot.data![i]['name']!),
                    subtitle: Text(snapshot.data![i]['score']!.toString()),
                  );
                });
          } else {
            print(snapshot.error);
          }
          return Container();
        });
  }
}
