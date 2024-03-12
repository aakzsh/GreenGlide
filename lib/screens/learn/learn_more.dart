import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/learn/global_citizen.dart';
import 'package:greenglide/utils/animations/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class LearnMore extends StatefulWidget {
  const LearnMore({super.key});

  @override
  State<LearnMore> createState() => _LearnMoreState();
}

class _LearnMoreState extends State<LearnMore> {
  final Uri _url = Uri.parse(
      'https://www.youtube.com/playlist?list=PLsBiWSQW2UI2Z4SY8LtOsPIKboC4EVjTr');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

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
                      "LEARN HOW TO MAKE EVERY TRAVEL A",
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
                    Image.asset(
                      "assets/images/logo.png",
                      height: 50,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context, CustomPageRoute(const GlobalCitizen())),
                      child: Image.asset(
                        "assets/icons/i.png",
                        height: 40,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "what is sustainable travel?",
                style: TextStyle(
                    fontFamily: "Luckiest Guy",
                    fontSize: 18,
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
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "Environmental sustainable travel focuses on reducing carbon footprint, protecting natural habitats, and preserving biodiversity. It entails using eco-friendly modes of transportation, minimizing waste generation, and supporting businesses that prioritize sustainability. It aims to mitigate negative impacts on ecosystems, promote conservation, and ensure that destinations remain pristine for future generations."),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "why is global warming a threat?",
                style: TextStyle(
                    fontFamily: "Luckiest Guy",
                    fontSize: 18,
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
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "Global warming poses a threat due to its far-reaching impacts on climate patterns, ecosystems, and human societies. Rising temperatures lead to melting ice caps, more frequent extreme weather events, sea level rise, disrupted agriculture, and increased health risks. It exacerbates environmental degradation, threatens biodiversity, and undermines sustainable development efforts worldwide."),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "public transport v/s private transport options.",
                style: TextStyle(
                    fontFamily: "Luckiest Guy",
                    fontSize: 18,
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
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "Public transport options are more sustainable than private transport due to reduced emissions per passenger. They promote efficient use of resources, alleviate traffic congestion, and minimize air pollution. Conversely, private transport contributes to carbon emissions, urban sprawl, and resource depletion, exacerbating environmental degradation and climate change concerns."),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "how to increase score in green glide?",
                style: TextStyle(
                    fontFamily: "Luckiest Guy",
                    fontSize: 18,
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
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "The best way of increasing your score in Green Glide is to prefer sustainable options. Afterall, we've only got one earth. The storyline that you're given with, try to choose travel options that best suit your preferences, while supporting the environmental cause. Suppose you can commute to your office via a personal cab and metro, both of them taking approximately the same time. You should ideally choose the metro in that case and reduce your carbon footprint. Lesser carbon footprint = more green glide points!"),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                const  Text("See more at   "),
                  InkWell(
                      onTap: () async {
                        await _launchUrl();
                      },
                      child:  Container(
                    
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                              color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                          "YouTube Playlist",
                          style: TextStyle(color: Colors.red),
                                                ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
