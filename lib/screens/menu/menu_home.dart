import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/main.dart';
import 'package:greenglide/screens/leaderboard/leaderboard_home.dart';
import 'package:greenglide/screens/learn/learn_more.dart';
import 'package:greenglide/screens/menu/checkin_reward.dart';
import 'package:greenglide/screens/menu/mode.dart';
import 'package:greenglide/screens/menu/settings.dart';
import 'package:greenglide/screens/menu/wallet.dart';
import 'package:greenglide/screens/profile/profile_home.dart';
import 'dart:math' as math;
import 'package:shimmer/shimmer.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({super.key});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  int _counter = 0;
  bool _isAnimating = false;
  int _animationCount = 0;
  bool show = true;
  late Timer _timer;
  @override
  void initState() {
    _startTimer();

    super.initState();
  }

  void _startTimer() {
    // Create a timer that repeats every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        // Update the counter
        _isAnimating = !_isAnimating;
        show = !show;
        // if(_isAnimating){

        // }
        _counter++;
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
                    child: Container(
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
                    duration: Duration(seconds: 2),
                    left: _isAnimating
                        ? MediaQuery.of(context).size.width
                        : -1000,
                    child: Opacity(
                        opacity: show ? 1 : 1,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 100),
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
                      Hero(
                          tag: "xyz",
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 70,
                            ),
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
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
                                      padding: EdgeInsets.only(top: 7, left: 7),
                                      child: Image.asset(
                                        "assets/images/coin.png",
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "243",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: ((context) =>
                                            CheckinReward()));
                                  },
                                  child: Image.asset(
                                    "assets/icons/add.png",
                                    height: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // showAboutDialog(context: context);
                              showDialog(
                                  context: context,
                                  builder: ((context) => Settings()));
                            },
                            child: Image.asset(
                              "assets/icons/settings.png",
                              scale: 4,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // onTap: (){showDialog(context: context, builder: ((context) => CheckinReward()));},

                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) => Wallet()));
                            },
                            child: Image.asset(
                              "assets/icons/wallet.png",
                              scale: 4,
                            ),
                          ),
                          SizedBox(
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
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () => Navigator.push(context, CustomPageRoute(Leaderboard())),
                              child: Image.asset(
                                "assets/icons/leaderboard.png",
                                scale: 4,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context, CustomPageRoute(Profile())),
                            child: Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: AppColors.tealblue,
                                  border:
                                      Border.all(color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: AppColors.golden,
                                    radius: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "@aakzsh",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Parallelogram(
                          width: 200,
                          height: 60,
                          angle: -math.pi / 6, // 30 degrees in radians
                          color: AppColors.green,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(CustomPageRoute(LearnMore()));
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
                                  child: Center(
                                      child: Text(
                                    "LEARN MORE",
                                    style: TextStyle(
                                        fontFamily: "Luckiest Guy",
                                        fontSize: 18,
                                        shadows: const [
                                          Shadow(
                                              // bottomLeft
                                              offset: Offset(-1.5, -1.5),
                                              color: Colors.black),
                                          Shadow(
                                              // bottomRight
                                              offset: Offset(1.5, -1.5),
                                              color: Colors.black),
                                          Shadow(
                                              // topRight
                                              offset: Offset(1.5, 1.5),
                                              color: Colors.black),
                                          Shadow(
                                              // topLeft
                                              offset: Offset(-1.5, 1.5),
                                              color: Colors.black),
                                        ]),
                                  ))),
                              Shimmer.fromColors(
                                  child: Container(
                                    height: 40,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  baseColor: Colors.white10,
                                  highlightColor: AppColors.golden)
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

class Parallelogram extends StatelessWidget {
  final double width;
  final double height;
  final double angle;
  final Color color;

  Parallelogram({
    required this.width,
    required this.height,
    required this.angle,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){showDialog(context: context, builder: ((context) => Mode()));},
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(250, 60), // Adjust the size as needed
            painter: ParallelogramPainter(),
          ),
          Text(
            "PLAY NOW",
            style: TextStyle(
                fontFamily: "Luckiest Guy",
                fontSize: 30,
                shadows: const [
                  Shadow(
                      // bottomLeft
                      offset: Offset(-2.5, -2.5),
                      color: Colors.black),
                  Shadow(
                      // bottomRight
                      offset: Offset(2.5, -2.5),
                      color: Colors.black),
                  Shadow(
                      // topRight
                      offset: Offset(2.5, 2.5),
                      color: Colors.black),
                  Shadow(
                      // topLeft
                      offset: Offset(-2.5, 2.5),
                      color: Colors.black),
                ]),
          )
        ],
      ),
    );
  }
}

class ParallelogramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = AppColors.green
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(
          size.width * 0.85, size.height) // Adjust the width ratio as needed
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.15, 0) // Adjust the width ratio as needed
      ..close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
