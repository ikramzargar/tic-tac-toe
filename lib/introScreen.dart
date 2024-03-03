import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'home.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Color(0xff402d09), letterSpacing: 3,fontWeight: FontWeight.w900));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xffa3998a),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Container(
                      child: Text(
                        "TIC TAC TOE",
                        style: myNewFont.copyWith(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: AvatarGlow(
                      duration: Duration(seconds: 2),
                      glowColor: Color(0xff402d09),
                      repeat: true,
                      startDelay: Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.none,
                            ),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[900],
                          child: Container(
                            child: Image.asset(
                              'images/tictactoelogo.png',
                              color: Colors.white,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          radius: 80.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container(
                      child: Text(
                        "@MADE_BY_IKRAM_ZARGAR",
                        style: myNewFont.copyWith(
                            fontSize: 15,),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      'PLAY GAME',
                      style: myNewFont.copyWith(fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
