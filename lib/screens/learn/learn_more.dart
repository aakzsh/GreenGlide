import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';

class LearnMore extends StatefulWidget {
  const LearnMore({super.key});

  @override
  State<LearnMore> createState() => _LearnMoreState();
}

class _LearnMoreState extends State<LearnMore> {
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
                      onTap: ()=>Navigator.pop(context),
                      child: Image.asset(
                        "assets/icons/back.png",
                        scale: 4,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                                      "LEARN HOW TO MAKE EVERY TRAVEL A",
                                      style: TextStyle(
                                          fontFamily: "Luckiest Guy",
                                          fontSize: 20,
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
                                    ),
                                    Image.asset("assets/images/logo.png", height: 50,),
                                    Spacer(),
                                    Image.asset("assets/icons/i.png", height: 40,)
                  ],
                ),
                
              ),
              SizedBox(height: 20,),
                Text(
                                      "what is sustainable travel?",
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
                                    ),
                                    SizedBox(height: 5,),
                                    Text("lorem lorem"),
                                     SizedBox(height: 20,),
                Text(
                                      "why is global warming a threat?",
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
                                    ),
                                    SizedBox(height: 5,),
                                    Text("lorem lorem"),
                                     SizedBox(height: 20,),
                Text(
                                      "public transport v/s private transport options.",
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
                                    ),
                                    SizedBox(height: 5,),
                                    Text("lorem lorem"),
                                     SizedBox(height: 20,),
                Text(
                                      "how to increase score in green glide?",
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
                                    ),
                                    SizedBox(height: 5,),
                                    Text("lorem lorem")
            ],
          ),
        ),
      ),
    );
  }
}
