import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Superman extends StatefulWidget {
  const Superman({Key? key}) : super(key: key);

  @override
  State<Superman> createState() => _SupermanState();
}

class _SupermanState extends State<Superman> {
  late RiveAnimationController _controller;

  @override
  void initState() {
    _controller = SimpleAnimation("orbitAnimation");
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF141320),
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onLongPressEnd: (_) {
                _controller.isActive = false;
              },
              onLongPressStart: (_) {
                _controller.isActive = true;
              },
              child: RiveAnimation.asset(
                "assets/rive/superman.riv",
                controllers: [_controller],
                onInit: (_) => setState(() {
                  _controller.isActive = false;
                }),
                fit: BoxFit.cover,
              ),
            ),
            const IgnorePointer(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Long Press to Continue Flying",
                    style: TextStyle(
                      color: Color(0x99FFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
