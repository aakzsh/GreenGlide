import 'dart:async';
import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/leaderboard/leaderboard_home.dart';
import 'package:greenglide/screens/learn/learn_more.dart';
import 'package:greenglide/screens/menu/settings.dart';
import 'package:greenglide/screens/menu/wallet.dart';
import 'package:greenglide/screens/profile/profile_home.dart';
import 'package:greenglide/services/shared_preferences/userdetails.dart';
import 'package:greenglide/utils/animations/page_transition.dart';
import 'package:greenglide/widgets/coins/coins_view.dart';
import 'package:greenglide/widgets/parallelogram/parallelogram.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'dart:math' as math;
import 'package:shimmer/shimmer.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({super.key});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  bool _isAnimating = false;
  bool show = true;
  late Timer _timer;
  String username = "";
  void setUsername() async {
    var user = await getUsernameLocally();
    setState(() {
      username = user.toString();
    });
  }

  @override
  void initState() {
    _startTimer();
    setUsername();
    super.initState();
  }

  void _startTimer() {
    // Create a timer that repeats every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _isAnimating = !_isAnimating;
        show = !show;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/skyline.png"),
                fit: BoxFit.fitWidth),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.gradientorange, AppColors.gradientpink],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/models/dashatar.png",
                scale: 4,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/images/bridge.png",
                        width: double.infinity,
                        scale: 4,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(seconds: 2),
                    left: _isAnimating
                        ? MediaQuery.of(context).size.width
                        : -1000,
                    child: Opacity(
                        opacity: show ? 1 : 1,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 100),
                          child: Opacity(
                            opacity: show ? 0 : 1,
                            child: Image.asset(
                              "assets/images/metro.png",
                              scale: 4,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 70,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CoinView(),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // showAboutDialog(context: context);
                              showDialog(
                                  context: context,
                                  builder: ((context) => const Settings()));
                            },
                            child: Image.asset(
                              "assets/icons/settings.png",
                              scale: 4,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) => const Wallet()));
                            },
                            child: Image.asset(
                              "assets/icons/wallet.png",
                              scale: 4,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () => Navigator.push(context,
                                  CustomPageRoute(const Leaderboard())),
                              child: Image.asset(
                                "assets/icons/leaderboard.png",
                                scale: 4,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context, CustomPageRoute(const Profile())),
                            child: Container(
                              height: 40,
                              width: 140 + username.length*1.0,
                              decoration: BoxDecoration(
                                  color: AppColors.tealblue,
                                  border: Border.all(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: AppColors.golden,
                                    radius: 15,
                                    backgroundImage: AssetImage("assets/models/dashatar.png"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "@$username",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Parallelogram(
                          width: 200,
                          height: 60,
                          angle: -math.pi / 6, // 30 degrees in radians
                          color: AppColors.green,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(CustomPageRoute(const LearnMore()));
                          },
                          child: Stack(
                            children: [
                              Container(
                                  height: 40,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: AppColors.golden,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: LuckiestGuyText(
                                          text: "LEARN MORE", fontSize: 18.0))),
                              Shimmer.fromColors(
                                  baseColor: Colors.white10,
                                  highlightColor: AppColors.golden,
                                  child: Container(
                                    height: 40,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
