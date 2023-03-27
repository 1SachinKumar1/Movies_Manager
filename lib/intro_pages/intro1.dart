import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'IntroPage.dart';
class Intro_page_one extends StatefulWidget {
  const Intro_page_one({Key? key}) : super(key: key);

  @override
  State<Intro_page_one> createState() => _Intro_page_oneState();
}

class _Intro_page_oneState extends State<Intro_page_one> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/images/two.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.5),
            child: const Padding(
              padding: EdgeInsets.only(top:10),
              child: Text(
                "Easily manage your movies!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }}