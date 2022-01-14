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

enum direction { UP, DOWN, LEFT, RIGHT }

class _PongGameState extends State<PongGame> {
  // Player variables (Bottom Brick)
  double playerX = -0.2;
  double playerWidth = 0.4; // out of 2

  // Ball variables
  double ballX = 0;
  double ballY = 0;
  var ballYDirection = direction.DOWN;
  var ballXDirection = direction.LEFT;
  // Game settings
  bool gameStarted = false;
  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(microseconds: 1), (timer) {
      // Update direction
      updateDirection();
      // Ball Movement
      moveBall();

      // Check if the player is dead
      if (isPlayerDead()) {
        timer.cancel();
        // Resets the game
        resetGame();
      }
    });
  }

  void resetGame() {
    setState(() {
      gameStarted = false;
      ballX = 0.0;
      ballY = 0.0;
      playerX = -0.2;
    });
  }

  bool isPlayerDead() {
    if (ballX >= 1) {
      return true;
    }

    return false;
  }

  void updateDirection() {
    setState(() {
      // Update vertical direction
      if (ballY >= 0.9 &&
          playerX + playerWidth >= ballX &&
          playerX + playerWidth <= ballX) {
        ballYDirection = direction.UP;
      } else if (ballY <= -0.9) {
        ballYDirection = direction.DOWN;
      }

      // Update horitzontal direction
      if (ballX >= 1)
        ballXDirection = direction.LEFT;
      else if (ballX <= -1) ballXDirection = direction.RIGHT;
    });
  }

  void moveBall() {
    setState(() {
      // Vertical movement
      if (ballYDirection == direction.DOWN)
        ballY += 0.001;
      else if (ballYDirection == direction.UP) ballY -= 0.001;
      // Horitzontal movement
      if (ballXDirection == direction.LEFT)
        ballX -= 0.001;
      else if (ballXDirection == direction.RIGHT) ballX += 0.001;
    });
  }

  void moveLeft() {
    setState(() {
      playerX -= 0.05;
    });
  }

  void moveRight() {
    setState(() {
      playerX += 0.05;
    });
  }

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
            // Top Brick
            MyBrick(x: 0.0, y: -0.9, brickWidth: playerWidth),

            // Bottom Brick
            MyBrick(x: playerX, y: 0.9, brickWidth: playerWidth),
            // Ball
            MyBall(x: ballX, y: ballY),
          ])),
        ),
      ),
    );
  }
}
