// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/src/pages/pages.dart';
import 'package:mobile_app/src/pages/utilities/utilities.dart';

class PongGame extends StatefulWidget {
  @override
  _PongGameState createState() => _PongGameState();
}

enum direction { UP, DOWN, LEFT, RIGHT }

class _PongGameState extends State<PongGame> {
  // Player variables (Bottom Brick)
  double playerX = -0.2;
  double brickWidth = 0.4; // out of 2
  int playerScore = 0;
  // Enemy variables (Top Brick)
  double enemyX = -0.2;
  int enemyScore = 0;
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
      updatePlayerDirection();
      // Ball Movement
      moveBall();

      // Move enemy Block
      moveEnemy();
      //updateEnemyDirection();
      // Check if the player is dead
      if (isPlayerDead()) {
        enemyScore++;
        timer.cancel();
        // Resets the game
        //resetGame();
        _showDialog(false);
      }
      if (isEnemyDead()) {
        playerScore++;
        timer.cancel();
        // Resets the game
        //resetGame();
        _showDialog(true);
      }
    });
  }

  bool isEnemyDead() {
    if (ballY <= -1) {
      return true;
    }

    return false;
  }

  void moveEnemy() {
    setState(() {
      enemyX = ballX;
    });
  }

  void _showDialog(bool enemydied) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                enemydied ? 'PINK WIN' : 'PURPLE WIN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              GestureDetector(
                // Resets the Game
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color:
                        enemydied ? Colors.pink[100] : Colors.deepPurple[100],
                    child: Text(
                      "PLAY AGAIN",
                      style: TextStyle(
                        color: enemydied
                            ? Colors.pink[800]
                            : Colors.deepPurple[800],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Return to HomePage if Exit is pressed.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.deepPurple[100],
                    child: Text(
                      "EXIT",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      gameStarted = false;
      ballX = 0.0;
      ballY = 0.0;
      playerX = -0.2;
      enemyX = -0.2;
    });
  }

  bool isPlayerDead() {
    if (ballY >= 1) {
      return true;
    }

    return false;
  }

  void updatePlayerDirection() {
    setState(() {
      // Update vertical direction
      if (ballY >= 0.9 && playerX + brickWidth >= ballX && playerX <= ballX) {
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

  /*void updateEnemyDirection() {
    setState(() {
      // Update vertical direction
      if (ballY >= 0.9 && enemyX + brickWidth >= ballX && enemyX <= ballX) {
        ballYDirection = direction.UP;
      } else if (ballY <= -0.9) {
        ballYDirection = direction.DOWN;
      }

      // Update horitzontal direction
      if (ballX >= 1)
        ballXDirection = direction.LEFT;
      else if (ballX <= -1) ballXDirection = direction.RIGHT;
    });
  }*/

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

  void playerMoveLeft() {
    setState(() {
      if (!(playerX - 0.1 <= -1)) playerX -= 0.1;
    });
  }

  void playerMoveRight() {
    setState(() {
      if (!(playerX + brickWidth >= 1)) playerX += 0.1;
    });
  }

  void enemyMoveRight() {
    setState(() {
      if (!(enemyX + brickWidth >= 1)) enemyX += 0.1;
    });
  }

  void enemyMoveLeft() {
    setState(() {
      if (!(enemyX - 0.1 <= -1)) enemyX -= 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft))
          playerMoveLeft();
        else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight))
          playerMoveRight();
        else if (event.isKeyPressed(LogicalKeyboardKey.keyD))
          enemyMoveRight();
        else if (event.isKeyPressed(LogicalKeyboardKey.keyA)) enemyMoveLeft();
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

            // Score screen
            ScoreScreen(
              gameHasStarted: gameStarted,
              enemyScore: enemyScore.toString(),
              playerScore: playerScore.toString(),
            ),

            // Enemy top Brick
            MyBrick(
                x: enemyX, y: -0.9, brickWidth: brickWidth, thisIsEnemy: true),

            // Player bottom Brick
            MyBrick(
                x: playerX, y: 0.9, brickWidth: brickWidth, thisIsEnemy: false),

            // Ball
            MyBall(x: ballX, y: ballY),
          ])),
        ),
      ),
    );
  }
}
