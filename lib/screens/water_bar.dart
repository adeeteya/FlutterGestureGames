import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class WaterBar extends StatefulWidget {
  const WaterBar({Key? key}) : super(key: key);

  @override
  State<WaterBar> createState() => _WaterBarState();
}

class _WaterBarState extends State<WaterBar> {
  int count = 0;
  SMIInput<double>? _level;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine');
    artboard.addController(controller!);
    _level = controller.findInput<double>('Level') as SMINumber;
  }

  void incrementValue() {
    if (count >= 100) return;
    _level?.change((++count).toDouble());
  }

  void decrementValue() {
    if (count <= 0) return;
    _level?.change((--count).toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              int sensitivity = 6;
              if (details.delta.dy > sensitivity) {
                decrementValue();
              } else if (details.delta.dy < -sensitivity) {
                incrementValue();
              }
            },
            child: RiveAnimation.asset(
              "assets/rive/water-bar.riv",
              stateMachines: const ['State Machine'],
              onInit: _onRiveInit,
              fit: BoxFit.cover,
            ),
          ),
          const IgnorePointer(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Swipe up/down to control the water level",
                  style: TextStyle(
                    color: Color(0x99FFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
