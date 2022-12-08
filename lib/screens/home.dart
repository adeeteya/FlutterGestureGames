import 'package:flutter/material.dart';
import 'package:gesture_games/screens/lumberjack_squats.dart';
import 'package:gesture_games/screens/rock_paper_scissor.dart';
import 'package:gesture_games/screens/super_man.dart';
import 'package:gesture_games/screens/tree.dart';
import 'package:gesture_games/screens/water_bar.dart';
import 'package:gesture_games/widgets/menu_tile.dart';
import 'package:gesture_games/widgets/neon/neon_text.dart';
import 'package:rive/rive.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF1F1930),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const NeonFlickerText(
          "Gesture Games",
          fontSize: 32,
        ),
      ),
      body: Stack(
        children: [
          const RiveAnimation.asset(
            "assets/rive/cosmos-bg.riv",
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              children: [
                MenuTile(
                  name: "Water Bar",
                  textColor: Colors.blue,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WaterBar()));
                  },
                ),
                MenuTile(
                  name: "Superman",
                  textColor: Colors.red,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Superman()));
                  },
                ),
                MenuTile(
                  name: "Tree",
                  textColor: Colors.green,
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Tree()));
                  },
                ),
                MenuTile(
                  name: "Lumberjack Squats",
                  textColor: Colors.brown,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LumberjackSquats()));
                  },
                ),
                MenuTile(
                  name: "Rock Paper Scissor",
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RockPaperScissor()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
