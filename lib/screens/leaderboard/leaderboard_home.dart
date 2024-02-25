import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:greenglide/widgets/text/table_entry.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
       width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
         
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.gradientorange, AppColors.gradientpink],
            ),
          ),
    child: Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/icons/back.png", scale: 4,)),const SizedBox(width: 10,), const LuckiestGuyText(text: "LEADERBOARD", fontSize: 30.0)],
          ),
        ), Image.asset("assets/models/dashatar.png", scale: 6,)],),

        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 400,
              child: Table(
                // border: TableBorder.all(color: Colors.black),
                children:const [
                  TableRow(children: [
                    LuckiestGuyText(text: "RANK", fontSize: 20.0),
                    LuckiestGuyText(text: "SCORE", fontSize: 20.0),
                    LuckiestGuyText(text: "USERNAME", fontSize: 20.0)
                  ]),
                  TableRow(children: [
                    TableEntry(data: "1."),
                    TableEntry(data: "12323"),
                    TableEntry(data: "@jondoe")
                  ])
                ],
              ),
            ),
          ),
        ),
    ],
    )
    ,
    ),
    
    );
  }
}