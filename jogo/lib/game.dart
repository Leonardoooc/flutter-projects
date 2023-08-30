import 'package:flutter/material.dart';
import 'dart:math';

class game extends StatefulWidget {
  @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {
  var _appImage = AssetImage("assets/images/padrao.png");
  var _message = "Select a option below";

  final Map<String, AssetImage> _messageOption = {
    "pedra": const AssetImage("assets/images/pedra.png"),
    "papel": const AssetImage("assets/images/papel.png"),
    "tesoura": const AssetImage("assets/images/tesoura.png"),
  };

  void _selectOption(String choise) {
    final options = ["pedra", "papel", "tesoura"];
    var random = Random().nextInt(3);
    var choiseApp = options[random];

    setState(() {
      this._appImage = _messageOption[choiseApp]!;
    });

    if ((choise == "pedra" && choiseApp == "tesoura") ||
        (choise == "tesoura" && choiseApp == "papel") ||
        (choise == "papel" && choiseApp == "pedra")) 
    {
      setState(() {
        this._message = "You win";
    });
    } else if ((choise == "tesoura" && choiseApp == "pedra") ||
               (choise == "papel" && choiseApp == "tesoura") ||
               (choise == "pedra" && choiseApp == "papel"))
    {
      setState(() {
        this._message = "You lose";
      });
    } else {
      setState(() {
        this._message = "Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JokenPo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "App's choise",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._appImage),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectOption("pedra"),
                child: Image.asset("assets/images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _selectOption("papel"),
                child: Image.asset("assets/images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _selectOption("tesoura"),
                child: Image.asset("assets/images/tesoura.png", height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}