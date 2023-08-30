import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Future<void> _showFoodChoiceDialog(BuildContext context) async {
    String? selectedFood = await showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return SimpleDialog(
          title: Text("Qual é a sua comida preferida?"),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(dialogContext, "brócolis");
              },
              child: Text("Brócolis"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(dialogContext, "carne");
              },
              child: Text("Carne"),
            ),
          ],
        );
      },
    );

    if (selectedFood != null) {
      print("Comida escolhida: $selectedFood");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar"),
          onPressed: () => _showFoodChoiceDialog(context),
        ),
      ),
    );
  }
}