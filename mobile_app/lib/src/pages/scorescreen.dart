import 'package:flutter/material.dart';
class ScoreScreen extends StatelessWidget {
  final bool gameHasStarted;
  final enemyScore;
  final playerScore ;

  ScoreScreen({required this.gameHasStarted, this.enemyScore, this.playerScore});

  @override
  Widget build(BuildContext context) {
    // If the game has started ...
    return gameHasStarted ? Stack(
      children: [
        Container(
          alignment: Alignment(0, 0),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width / 4,
            color: Colors.grey[800],
          ),
        ),
        Container(
              alignment: Alignment(0, -0.3),
              child: Text(
                enemyScore,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 100,
                ),
              ),
            ),

            Container(
              alignment: Alignment(0, 0.3),
              child: Text(
                playerScore ,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 100,
                ),
              ),
            ),
      ],
    ) : Container();
  }
}