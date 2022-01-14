import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/src/pages/ball.dart';
import 'package:mobile_app/src/pages/brick.dart';
import 'package:mobile_app/src/pages/coverscreen.dart';

class PongGame extends StatefulWidget {
  @override
  _PongGameState createState() => _PongGameState();
}

enum direction { UP, DOWN }

class _PongGameState extends State<PongGame> {
  double ballX = 0;
  double ballY = 0;
  var ballDirection = direction.DOWN;

  bool gameStarted = false;
  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(microseconds: 1), (timer) {
      updateDirection();
      moveBall();
    });
  }

  void updateDirection() {
    setState(() {
      if (ballY >= 0.9) {
        ballDirection = direction.UP;
      } else if (ballY <= -0.9) {
        ballDirection = direction.DOWN;
      }
    });
  }

  void moveBall() {
    setState(() {
      if (ballDirection == direction.DOWN)
        ballY += 0.1;
      else if (ballDirection == direction.UP) ballY -= 0.1;
    });
  }

  void moveLeft() {}

  void moveRight() {}
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft))
          moveLeft();
        else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) moveRight();
      },
      child: GestureDetector(
        onTap: startGame,
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
              child: Stack(children: [
            CoverScreen(
              gameHasStarted: gameStarted,
            ),
            MyBrick(x: 0.0, y: -0.9),
            MyBrick(x: 0.0, y: 0.9),
            MyBall(x: 0.0, y: 0.0)
          ])),
        ),
      ),
    );
  }
}
