import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class GlobalCitizen extends StatefulWidget {
  const GlobalCitizen({super.key});

  @override
  State<GlobalCitizen> createState() => _GlobalCitizenState();
}

class _GlobalCitizenState extends State<GlobalCitizen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        "assets/icons/back.png",
                        scale: 4,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "LEARN ABOUT THE GLOBAL CITIZEN INITIATIVE",
                      style: TextStyle(
                          fontFamily: "Luckiest Guy",
                          fontSize: 20,
                          shadows: [
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
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/globalcitizen.png",
                height: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              const LuckiestGuyText(text: "what's at stake?", fontSize: 18.0),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "Global Citizen is a movement on a mission to end extreme poverty — with the 2023 Global Citizen Festival campaign taking aim at the major issues driving extreme poverty, including the climate crisis, gender inequity, food insecurity, and more."),
              const SizedBox(
                height: 20,
              ),
              const LuckiestGuyText(text: "what can we do?", fontSize: 18.0),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "You can join the movement of Global Citizens all around the world who are taking action to call on world leaders and the private sector to urgently tackle the world's biggest challenges and end extreme poverty."),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
