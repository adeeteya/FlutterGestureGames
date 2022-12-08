import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Tree extends StatefulWidget {
  const Tree({Key? key}) : super(key: key);

  @override
  State<Tree> createState() => _TreeState();
}

class _TreeState extends State<Tree> {
  int count = 0;
  SMIInput<double>? _smiInput;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    _smiInput = controller.findInput<double>("input") as SMINumber;
  }

  void _increment() {
    if (count >= 100) {
      setState(() {});
      return;
    }
    _smiInput?.change((++count).toDouble());
  }

  void _reset() {
    setState(() {
      count = 0;
    });
    _smiInput?.change(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF4D4C61),
      appBar: AppBar(
        actions: (count >= 100)
            ? [
                IconButton(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                ),
              ]
            : null,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: _increment,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RiveAnimation.asset(
                "assets/rive/tree.riv",
                onInit: _onRiveInit,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const IgnorePointer(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Tap to speed up the growth of the tree",
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
