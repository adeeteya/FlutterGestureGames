import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RockPaperScissor extends StatefulWidget {
  const RockPaperScissor({Key? key}) : super(key: key);

  @override
  State<RockPaperScissor> createState() => _RockPaperScissorState();
}

class _RockPaperScissorState extends State<RockPaperScissor> {
  bool _moveMade = false;
  late final SMITrigger? _roRo;
  late final SMITrigger? _roPa;
  late final SMITrigger? _roSc;
  late final SMITrigger? _paRo;
  late final SMITrigger? _paPa;
  late final SMITrigger? _paSc;
  late final SMITrigger? _scRo;
  late final SMITrigger? _scPa;
  late final SMITrigger? _scSc;
  late final SMITrigger? _goBack;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _roRo = controller.findInput<bool>('ro_ro') as SMITrigger;
    _roPa = controller.findInput<bool>('ro_pa') as SMITrigger;
    _roSc = controller.findInput<bool>('ro_sc') as SMITrigger;
    _paRo = controller.findInput<bool>('pa_ro') as SMITrigger;
    _paPa = controller.findInput<bool>('pa_pa') as SMITrigger;
    _paSc = controller.findInput<bool>('pa_sc') as SMITrigger;
    _scRo = controller.findInput<bool>('sc_ro') as SMITrigger;
    _scPa = controller.findInput<bool>('sc_pa') as SMITrigger;
    _scSc = controller.findInput<bool>('sc_sc') as SMITrigger;
    _goBack = controller.findInput<bool>('GoBack') as SMITrigger;
  }

  void play(int playerChoice) {
    setState(() {
      _moveMade = true;
    });
    int rivalChoice = Random().nextInt(3);
    if (playerChoice == 0 && rivalChoice == 0) {
      _roRo?.fire();
    } else if (playerChoice == 0 && rivalChoice == 1) {
      _roPa?.fire();
    } else if (playerChoice == 0 && rivalChoice == 2) {
      _roSc?.fire();
    } else if (playerChoice == 1 && rivalChoice == 0) {
      _paRo?.fire();
    } else if (playerChoice == 1 && rivalChoice == 1) {
      _paPa?.fire();
    } else if (playerChoice == 1 && rivalChoice == 2) {
      _paSc?.fire();
    } else if (playerChoice == 2 && rivalChoice == 0) {
      _scRo?.fire();
    } else if (playerChoice == 2 && rivalChoice == 1) {
      _scPa?.fire();
    } else if (playerChoice == 2 && rivalChoice == 2) {
      _scSc?.fire();
    }
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: (_moveMade)
                  ? () {
                      _goBack?.fire();
                      setState(() {
                        _moveMade = false;
                      });
                    }
                  : null,
              child: RiveAnimation.asset(
                "assets/rive/rock-paper-scissors.riv",
                onInit: _onRiveInit,
                fit: BoxFit.fitWidth,
              ),
            ),
            if (!_moveMade)
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        play(0);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/rock.png",
                          height: 32,
                          width: 32,
                          color: const Color(0xFFFF5678),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        play(1);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/paper.png",
                          height: 32,
                          width: 32,
                          color: const Color(0xFFF5C12C),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        play(2);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/scissors.png",
                          height: 32,
                          width: 32,
                          color: const Color(0xFF47BBF4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
