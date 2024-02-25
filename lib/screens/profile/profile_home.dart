import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/widgets/coins/coins_view.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                      const LuckiestGuyText(text: "PROFILE", fontSize: 30.0)
                    ],
                  ),
                ),
                Image.asset(
                  "assets/models/dashatar.png",
                  scale: 5,
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                    width: 400,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: CoinView(),
                        ),
                        const LuckiestGuyText(
                            text: "CHANGE OUTFIT", fontSize: 25.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MaterialButton(
                              color: AppColors.golden,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                      width: 1.5, color: Colors.black)),
                              onPressed: () {},
                              child: const LuckiestGuyText(
                                text: "2500 COINS",
                                fontSize: 18.0,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/leftarrow.png",
                                  scale: 4,
                                ),
                                Image.asset(
                                  "assets/models/dashatar.png",
                                  height: 100,
                                ),
                                Image.asset(
                                  "assets/icons/rightarrow.png",
                                  scale: 4,
                                )
                              ],
                            ),
                            Image.asset(
                              "assets/icons/checkbox.png",
                              width: 35,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: AppColors.tealblue,
                                      border: Border.all(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Row(
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
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/icons/edit.png",
                                          scale: 4,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/icons/checkbox.png",
                                  height: 40,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
