import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/menu/checkin_reward.dart';

class CoinView extends StatefulWidget {
  const CoinView({super.key});

  @override
  State<CoinView> createState() => _CoinViewState();
}

class _CoinViewState extends State<CoinView> {
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
          const Text(
            "243",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) => const CheckinReward()));
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
