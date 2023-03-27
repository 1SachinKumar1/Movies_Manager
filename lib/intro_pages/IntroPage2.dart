import 'package:flutter/material.dart';
class IntroPageTwo extends StatefulWidget {
  const IntroPageTwo({Key? key}) : super(key: key);

  @override
  State<IntroPageTwo> createState() => _IntroPageTwoState();
}

class _IntroPageTwoState extends State<IntroPageTwo> {
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
                  "assets/images/one.png",
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
                "Once completed mark it as done!",
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
  }
}
