import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LumberjackSquats extends StatefulWidget {
  const LumberjackSquats({Key? key}) : super(key: key);

  @override
  State<LumberjackSquats> createState() => _LumberjackSquatsState();
}

class _LumberjackSquatsState extends State<LumberjackSquats> {
  int _squatCount = 0;
  bool _isSquatting = false;
  late final RiveAnimationController _controller;

  @override
  void initState() {
    _controller = OneShotAnimation("Squat", autoplay: false, onStart: () {
      setState(() {
        _isSquatting = true;
      });
    }, onStop: () {
      setState(() {
        _squatCount++;
        _isSquatting = false;
      });
    });
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
      backgroundColor: const Color(0xFFB9F08E),
      appBar: AppBar(
        title: Text(
          "$_squatCount Squats",
          style: const TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (!_isSquatting) {
                  _controller.isActive = true;
                }
              },
              child: RiveAnimation.asset(
                "assets/rive/lumberjack-squats.riv",
                animations: const ["Idle"],
                controllers: [_controller],
                fit: BoxFit.cover,
              ),
            ),
            const IgnorePointer(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Tap to squat",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
