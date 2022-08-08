import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../server_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLoadingSellers = false;
  dynamic _timer;

  getsellers() {
    // ServerHandler.getSellers()
    //     .then((value) => print(value))
    //     .catchError((e) => print(e));
  }

  @override
  void initState() {
    super.initState();

    //Initalising the timer

    _timer = Timer(
        const Duration(seconds: 3),
        () => {
              showLoadingSellers = true,
              setState(() {}),
              getsellers(),
            });
  }

  @override
  //Disposing timer
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      color: const Color(0xffE6F3EC),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            //Title
            'Akasawo',
            style: GoogleFonts.pacifico(
              color: const Color(0xff4E8489),
              fontSize: 28,
            ),
          ),
          //Loading animation
          if (showLoadingSellers)
            const SizedBox(
              height: 20.0,
              width: 20.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4E8489)),
                strokeWidth: 1.5,
              ),
            ),
          if (showLoadingSellers)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              //Loading Text
              child: Text(
                'Loadng Sellers',
                style: GoogleFonts.poppins(),
              ),
            ),
        ],
      ),
    ));
  }
}
