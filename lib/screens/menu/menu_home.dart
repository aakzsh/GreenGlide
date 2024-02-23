import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({super.key});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/bridge.png",
                  width: double.maxFinite,
                  scale: 4,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Hero(tag: "logo", child: Padding(padding: EdgeInsets.all(5), child: Image.asset("assets/images/logo.png", height: 70,),))],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
