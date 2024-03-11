import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/menu/checkin_reward.dart';
import 'package:greenglide/screens/menu/checkin_reward_pending.dart';
import 'package:greenglide/services/firebase/dailycheckin.dart';
import 'package:greenglide/services/shared_preferences/coins.dart';

class CoinView extends StatefulWidget {
  const CoinView({super.key});

  @override
  State<CoinView> createState() => _CoinViewState();
}

class _CoinViewState extends State<CoinView> {
  int coins = 0;
  updateData() async {
    var c = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      coins = c.data()!["coins"];
    });
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
          color: AppColors.golden,
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/coin.png",
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 7),
                child: Image.asset(
                  "assets/images/coin.png",
                  height: 20,
                ),
              )
            ],
          ),
          Text(
            coins.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
          InkWell(
            onTap: () async {
              var checkin = await getDailyCheckinLocally();
              var lastCheckin =  DateTime.parse(checkin.toString());
              var current = DateTime.now();
              if (current.difference(lastCheckin).inHours <2) {
                showDialog(
                    context: context,
                    builder: ((context) => const CheckinRewardPending()));
              } else {
                showDialog(
                    context: context,
                    builder: ((context) => const CheckinReward()));
                await dailyCheckin();
                await updateData();
                await setDailyCheckinLocally(DateTime.now().toString());
              }
            },
            child: Image.asset(
              "assets/icons/add.png",
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
