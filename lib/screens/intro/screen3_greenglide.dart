import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/menu/menu_home.dart';

class GreenGlideIntro extends StatefulWidget {
  const GreenGlideIntro({super.key});

  @override
  State<GreenGlideIntro> createState() => _GreenGlideIntroState();
}

class _GreenGlideIntroState extends State<GreenGlideIntro> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
     void initState(){
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MenuHome()),
          (route) => false);
    });
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
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
        child: FadeTransition(opacity: _animation, child: Hero(tag: "logo", child:  Image.asset("assets/images/logo.png", scale: 4,),))
      ),
    );
  }
}
