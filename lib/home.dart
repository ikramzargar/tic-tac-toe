import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static var myTextStyle = GoogleFonts.pressStart2p(
    textStyle: TextStyle(
      color: Color(0xff402d09),
      fontSize: 20,
      letterSpacing: 3,
    ),
  );
  bool changePlayer = true;
  List<String> displayEx0h = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int filledCells = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffa3998a),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'ScoreBoard',
                      style: myTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('Player X', style: myTextStyle),
                            Text(xScore.toString(), style: myTextStyle),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text('Player O', style: myTextStyle),
                            Text(oScore.toString(), style: myTextStyle),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tapped(index, context); // Pass context here
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff402d09)),
                    ),
                    child: Center(
                      child: Text(
                        displayEx0h[index],
                        style: TextStyle(
                          color: Color(0xff402d09),
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  clearScore();
                  clearBoard();
                });
              },
              child: Text('Reset', style: myTextStyle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Made by IKRAM ZARGAR',
              style: myTextStyle.copyWith(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  void tapped(int index, BuildContext context) {
    if (changePlayer && displayEx0h[index] == '') {
      displayEx0h[index] = 'O';
      filledCells += 1;
    } else if (!changePlayer && displayEx0h[index] == '') {
      displayEx0h[index] = 'X';
      filledCells += 1;
    }

    changePlayer = !changePlayer;
    checkWinner(context);
  }

  void checkWinner(BuildContext context) {
    if (displayEx0h[0] == displayEx0h[1] &&
        displayEx0h[0] == displayEx0h[2] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0], context);
    } else if (displayEx0h[3] == displayEx0h[4] &&
        displayEx0h[3] == displayEx0h[5] &&
        displayEx0h[3] != '') {
      _showWinDialog(displayEx0h[3], context);
    } else if (displayEx0h[6] == displayEx0h[7] &&
        displayEx0h[6] == displayEx0h[8] &&
        displayEx0h[6] != '') {
      _showWinDialog(displayEx0h[6], context);
    } else if (displayEx0h[0] == displayEx0h[3] &&
        displayEx0h[0] == displayEx0h[6] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0], context);
    } else if (displayEx0h[1] == displayEx0h[4] &&
        displayEx0h[1] == displayEx0h[7] &&
        displayEx0h[1] != '') {
      _showWinDialog(displayEx0h[1], context);
    } else if (displayEx0h[2] == displayEx0h[5] &&
        displayEx0h[2] == displayEx0h[8] &&
        displayEx0h[2] != '') {
      _showWinDialog(displayEx0h[2], context);
    } else if (displayEx0h[0] == displayEx0h[4] &&
        displayEx0h[0] == displayEx0h[8] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0], context);
    } else if (displayEx0h[2] == displayEx0h[4] &&
        displayEx0h[2] == displayEx0h[6] &&
        displayEx0h[2] != '') {
      _showWinDialog(displayEx0h[2], context);
    } else if (filledCells == 9) {
      showDrawDialog(context);
    }
  }

  void _showWinDialog(String winner, BuildContext context) {
    updateScore(winner);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  clearBoard();
                });
                Navigator.of(context).pop();
              },
              child: Text('Play Again!'),
            )
          ],
          title: Text(winner + ' is the Winner!'),
        );
      },
    );
  }

  void clearBoard() {
    for (int i = 0; i < 9; i++) {
      displayEx0h[i] = '';
    }
    filledCells = 0;
  }

  void clearScore() {
    oScore = 0;
    xScore = 0;
  }

  void updateScore(String winner) {
    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void showDrawDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  clearBoard();
                });
                Navigator.of(context).pop();
              },
              child: Text('Play Again!'),
            )
          ],
          title: Text('Draw!'),
        );
      },
    );
  }
}
