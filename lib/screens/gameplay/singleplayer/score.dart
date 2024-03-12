import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/menu/menu_home.dart';
import 'package:greenglide/services/api/wallet_api.dart';
import 'package:greenglide/services/firebase/addCardtoFirebase.dart';
import 'package:greenglide/services/firebase/addToLeaderboard.dart';
import 'package:greenglide/services/firebase/dailycheckin.dart';
import 'package:greenglide/utils/animations/page_transition.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:greenglide/widgets/text/normal_text_center.dart';

class SinglePlayerScore extends StatefulWidget {
  const SinglePlayerScore(
      {super.key, required this.score, required this.coins, required this.sound, required this.lang});
  final int score;
  final int coins;
  final bool sound;
  final String lang;

  @override
  State<SinglePlayerScore> createState() => _SinglePlayerScoreState();
}

class _SinglePlayerScoreState extends State<SinglePlayerScore>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _textController = TextEditingController();
  int offer = 0;
  calculateOffer() {
    int s = 0;
    if (widget.score > 100 && widget.score < 500) {
      s = 5;
    } else if (widget.score <= 100) {
      s = 2;
    } else if (widget.score >= 500 && widget.score < 1000) {
      s = 10;
    } else {
      s = 25;
    }

    setState(() {
      offer = s;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )..repeat();
    addToLeaderboard(widget.score);
    updateCoins(widget.coins);
    calculateOffer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "assets/images/confetti.png",
                    height: 200,
                  ),
                ),
              ),
              Image.asset(
                "assets/images/trophy.png",
                scale: 6,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "assets/images/confetti.png",
                    height: 250,
                  ),
                ),
              ),
              Container(
                height: 180,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const LuckiestGuyText(text: "OFFER CARD", fontSize: 20),
                    NormalTextCenter(
                        text:
                            "CONGRATS!! You've earned $offer% off card, which you can use at sustainability stores curated by us",
                        fontSize: 12.0),
                    MaterialButton(
                        minWidth: 100,
                        height: 40,
                        color: AppColors.gradientorange,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () async {
                          // await fetchData();
                          if(widget.sound){ FlameAudio.play("button.wav");}
                          showDialog(
                              context: context,
                              builder: ((context) => Dialog(
                                  backgroundColor: AppColors.blue,
                                  child: SizedBox(
                                    width: 400,
                                    height: 250,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        LuckiestGuyText(
                                            text: "CLAIM OFFER",
                                            fontSize: 25.0),
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            controller: _textController,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter Email Address"),
                                          ),
                                        ),
                                        MaterialButton(
                                            minWidth: 150,
                                            height: 40,
                                            color: AppColors.green,
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 2,
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            onPressed: () async {
                                              var res = await addToGoogleWallet(
                                                  _textController.text);
                                             await addCardtoFirebase(res);
                                                  Navigator.pop(context);
                                                   Navigator.pushAndRemoveUntil(context,
                        CustomPageRoute( MenuHome(lang: widget.lang,)), (route) => false);
                                            },
                                            child: const LuckiestGuyText(
                                                text: "ADD TO GOOGLE WALLET",
                                                fontSize: 20.0))
                                      ],
                                    ),
                                  ))));
                        },
                        child: const LuckiestGuyText(
                            text: "CLAIM", fontSize: 14.0))
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LuckiestGuyText(text: "GAME FINISHED!!", fontSize: 30.0),
              LuckiestGuyText(text: "SCORE: ${widget.score}", fontSize: 25.0),
              LuckiestGuyText(
                  text: "COINS COLLECTED: ${widget.coins}", fontSize: 15.0),
              MaterialButton(
                  minWidth: 150,
                  height: 40,
                  color: AppColors.green,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                     if(widget.sound){ FlameAudio.play("button.wav");}
                    Navigator.pushAndRemoveUntil(context,
                        CustomPageRoute( MenuHome(lang: widget.lang,)), (route) => false);
                  },
                  child: const LuckiestGuyText(text: "HOME", fontSize: 20.0))
            ],
          )
        ],
      ),
    );
  }
}
