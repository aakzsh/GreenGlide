import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/menu/menu_home.dart';
import 'package:greenglide/services/firebase/checkUsernameExists.dart';
import 'package:greenglide/services/shared_preferences/userdetails.dart';
import 'package:greenglide/utils/animations/page_transition.dart';
import 'package:greenglide/utils/helper/helper.dart';
import 'package:greenglide/widgets/coins/coins_view.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:greenglide/widgets/text/normal_text.dart';
import 'package:greenglide/widgets/text/normal_text_center.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.lang});
  final String lang;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "";
  bool editingMode = false;
  late TextEditingController controller;
  setUsername() async {
    var user = await getUsernameLocally();
    setState(() {
      username = user.toString();
    });
    controller = TextEditingController(text: user.toString());
  }

  changeUsername() async {
    if (controller.text == username) {
      showDialog(
          context: context,
          builder: ((context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: const Color.fromARGB(255, 234, 104, 71),
              child:  SizedBox(
                width: 300,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LuckiestGuyText(text: Helper.alert[widget.lang]!, fontSize: 25.0),
                    NormalText(
                        text: Helper.usernameNotChangedYet[widget.lang]!, fontSize: 15)
                  ],
                ),
              ))));
    } else {
      var usernameExists = await checkUsernameExists(controller.text);
      if (usernameExists) {
        showDialog(
            context: context,
            builder: ((context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromARGB(255, 234, 104, 71),
                child:  SizedBox(
                  width: 300,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LuckiestGuyText(text: Helper.error[widget.lang]!, fontSize: 25.0),
                      NormalTextCenter(
                          text:
                              Helper.usernameAlreadyExists[widget.lang]!,
                          fontSize: 15)
                    ],
                  ),
                ))));
      } else {
        await editUsername(controller.text, username);
        showDialog(
            context: context,
            builder: ((context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromARGB(255, 74, 234, 71),
                child:  SizedBox(
                  width: 300,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LuckiestGuyText(text:  Helper.success[widget.lang]!, fontSize: 25.0),
                      NormalTextCenter(
                          text:
                               Helper.usernameChanged[widget.lang]!,
                          fontSize: 15)
                    ],
                  ),
                ))));
      }
    }
  }

  @override
  void initState() {
    setUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: double.maxFinite,
          height: h,
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
                            onTap: () => Navigator.pushAndRemoveUntil(
                                context,
                                CustomPageRoute( MenuHome(lang: widget.lang,)),
                                (route) => false),
                            child: Image.asset(
                              "assets/icons/back.png",
                              scale: 4,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                         LuckiestGuyText(text: Helper.profile[widget.lang]!, fontSize: 30.0)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
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
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topRight,
                            child: CoinView(),
                          ),
                           LuckiestGuyText(
                              text: Helper.changeOutfit[widget.lang]!, fontSize: 25.0),
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
                                child:  LuckiestGuyText(
                                  text: "2500 ${Helper.coins[widget.lang]!}",
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
                                  SizedBox(width: 20,),
                                  Image.asset(
                                    "assets/models/character.png",
                                    height: 100,
                                  ),
                                  SizedBox(width: 20,),
                                  Image.asset(
                                    "assets/icons/rightarrow.png",
                                    scale: 4,
                                  )
                                ],
                              ),
                              SizedBox(height: 10,),
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
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const CircleAvatar(
                                              backgroundColor: AppColors.golden,
                                              radius: 15,
                                              backgroundImage: AssetImage(
                                                  "assets/models/character.png"),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            editingMode
                                                ? SizedBox(
                                                    width: 100,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 3),
                                                      child: TextFormField(
                                                        controller: controller,
                                                        textAlignVertical:
                                                            TextAlignVertical
                                                                .top,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    "@$username",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            controller.text = username;
                                            if (editingMode) {
                                              await setUsername();
                                            }
                                            setState(() {
                                              editingMode = !editingMode;
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.asset(
                                              "assets/icons/edit.png",
                                              scale: 4,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await changeUsername();
                                    },
                                    child: Image.asset(
                                      "assets/icons/checkbox.png",
                                      height: 40,
                                    ),
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
      ),
    );
  }
}
