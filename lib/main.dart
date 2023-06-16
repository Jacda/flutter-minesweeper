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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
    return const MaterialApp(
      title: "HELLO",
      home: Board(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
    );
  }
}
