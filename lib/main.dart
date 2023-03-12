import 'package:flutter/material.dart';
import 'package:hang_game_project/screen/home_screen.dart';
import 'package:hang_game_project/ui/colors.dart';

import 'package:hang_game_project/ui/widget/letter.dart';
import 'package:hang_game_project/utils/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
