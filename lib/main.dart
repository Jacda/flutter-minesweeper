import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minesweeper/board.dart';

void main() {
  runApp(const Minesweeper());
}

class Minesweeper extends StatelessWidget {
  const Minesweeper({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      home: Board(),
      debugShowCheckedModeBanner: false,
    );
  }
}
