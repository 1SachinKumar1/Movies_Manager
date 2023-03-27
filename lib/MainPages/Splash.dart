import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:task_manager/intro_pages/IntroPage.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const IntroPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade300,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
                  child: Lottie.asset("assets/images/new.json"),
          ),
          Text(
            "Watch 'Em All",
            style: GoogleFonts.arefRuqaa(
              fontSize: 30,
            ),
          )
        ]));
  }
}
