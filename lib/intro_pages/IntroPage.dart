import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_manager/Auth%20Pages/Auth.dart';
import 'IntroPage2.dart';
import 'intro1.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  bool finalPage = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              finalPage = (index == 2);
            });
          },
          controller: _controller,
          children: [
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/images/three.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: const Alignment(0, 0.5),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Easily add your movies!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Intro_page_one(),
            const IntroPageTwo(),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //first skip button here
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Skip",
                      style: GoogleFonts.arefRuqaa(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.black)),
                ),
              ),

              //then add smooth page indicator here

              SmoothPageIndicator(controller: _controller, count: 3),

              //if last page then this else
              finalPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Auth()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Done',
                          style: GoogleFonts.arefRuqaa(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeIn);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Next',
                          style: GoogleFonts.arefRuqaa(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
