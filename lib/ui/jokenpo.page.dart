import 'package:flutter/material.dart';
import 'dart:math';

class Jokenpo extends StatefulWidget {
  @override
  _JokenpoState createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  int rock = 0;
  int paper = 1;
  int scizor = 2;

  String choose = "assets/images/paper.png";
  String botChoose = "assets/images/paper.png";
  String winner = "Selecione: Pedra, Papel, ou Tesoura para jogar!";

  void play(int choose) {
    int botChoose = Random().nextInt(3);

    setState(() {
      this.choose = this.getImage(choose);
      this.botChoose = this.getImage(botChoose);
      this.winner = this.getWinner(choose, botChoose);
    });
  }

  // 0 = draw
  // 1 = player
  // 2 = bot
  String getWinner(int choose, int botChoose) {
    if (choose == botChoose) {
      return "Empate!";
    } else if (choose == rock && botChoose == scizor) {
      return "Você venceu!";
    } else if (choose == paper && botChoose == rock) {
      return "Você venceu!";
    } else if (choose == scizor && botChoose == paper) {
      return "Você venceu!";
    } else {
      return "O computador ganhou!";
    }
  }

  String getImage(int choose) {
    if (choose == 0) {
      return "assets/images/rock.png";
    } else if (choose == 1) {
      return "assets/images/paper.png";
    } else {
      return "assets/images/scizor.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jokenpô'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                winner,
                style: TextStyle(
                  fontSize: 20,
                )
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sua jogada:",
                          style: TextStyle(
                            fontSize: 18,
                          )
                        ),
                        SizedBox(height: 50),
                        Image.asset(choose)
                      ],
                    )
                  ),
                  Flexible(
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Jogada do Computador:",
                          style: TextStyle(
                            fontSize: 18,
                          )
                        ),
                        SizedBox(height: 50),
                        Image.asset(botChoose)
                      ],
                    )
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: ElevatedButton(
                        child: Text('Pedra'),
                        onPressed: () => play(rock),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: ElevatedButton(
                        child: Text('Papel'),
                        onPressed: () => play(paper),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: ElevatedButton(
                        child: Text('Tesoura'),
                        onPressed: () => play(scizor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}