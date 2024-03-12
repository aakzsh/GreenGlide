import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/services/firebase.dart';
import 'package:greenglide/utils/helper/helper.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:greenglide/widgets/text/table_entry.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key, required this.lang});
  final String lang;

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  List<dynamic> scores = [];

  List<Map<String, dynamic>> convertList(List<dynamic> originalList) {
  List<Map<String, dynamic>> newList = [];
  originalList.forEach((map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = value;
    });
    newList.add(newMap);
  });
  return newList;
}


  setLeaderboard() async {
    var leaderboard = await getLeaderboard();
    leaderboard = convertList(leaderboard);
    List<Map<String, dynamic>> l = leaderboard;
    l.sort((a, b) => b["score"].compareTo(a["score"]));
    setState(() {
      scores = l;
    });
    print("score is $scores");
  }

  @override
  void initState() {
    super.initState();
    setLeaderboard();
  }
  int index  = 0;

  List<TableRow> buildWidgets() {
    List<TableRow> widgets = [
       TableRow(children: [
        LuckiestGuyText(text: Helper.rank[widget.lang]!, fontSize: 20.0),
        LuckiestGuyText(text: Helper.score[widget.lang]!, fontSize: 20.0),
        LuckiestGuyText(text: Helper.username[widget.lang]!, fontSize: 20.0)
      ]),
    ];
    for (var item in scores) {
      index++;
      widgets.add(
        TableRow(children: [
           TableEntry(data: "$index."),
          TableEntry(data: item["score"].toString()),
          TableEntry(data: "@${item["username"]}")
        ]),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.gradientorange, AppColors.gradientpink],
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            "assets/icons/back.png",
                            scale: 4,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                       LuckiestGuyText(text: Helper.leaderboard[widget.lang]!, fontSize: 30.0)
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 20, top: 20), 
                child: Image.asset(
                  "assets/models/character.png",
                  scale: 9,
                ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 400,
                  child: Table(
                    // border: TableBorder.all(color: Colors.black),
                    children: buildWidgets(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
