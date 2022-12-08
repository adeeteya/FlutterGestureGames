import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class NeonText extends StatefulWidget {
  const NeonText(
    this.text, {
    Key? key,
    this.fontColor = Colors.white,
    this.spreadColor = Colors.pink,
    this.blurRadius = 20,
    this.fontSize = 24,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.wordSpacing,
    this.maxLine,
    this.letterSpacing,
    this.textOverflow,
  }) : super(key: key);

  final String text;
  final FontWeight fontWeight;
  final double fontSize, blurRadius;
  final Color fontColor, spreadColor;
  final TextOverflow? textOverflow;
  final String? fontFamily;
  final double? wordSpacing, letterSpacing;
  final int? maxLine;

  @override
  State<StatefulWidget> createState() {
    return NeonTextState();
  }
}

class NeonTextState extends State<NeonText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.fontColor,
        shadows: [
          Shadow(color: widget.spreadColor, blurRadius: widget.blurRadius),
        ],
        fontWeight: widget.fontWeight,
        fontSize: widget.fontSize,
        fontFamily: widget.fontFamily,
        wordSpacing: widget.wordSpacing,
        overflow: widget.textOverflow,
        letterSpacing: widget.letterSpacing,
      ),
      maxLines: widget.maxLine,
      overflow: widget.textOverflow,
    );
  }
}

class NeonFlickerText extends StatefulWidget {
  const NeonFlickerText(
    this.text, {
    Key? key,
    this.spreadColor = Colors.pink,
    this.blurRadius = 20,
    this.randomFlicker = true,
    this.flickerTime = 2500,
    this.fontSize = 24,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.white,
    this.fontFamily,
    this.wordSpacing,
    this.letterSpacing,
    this.maxLine,
    this.overflow,
  }) : super(key: key);

  final String text;
  final FontWeight fontWeight;
  final double fontSize, blurRadius;
  final Color fontColor, spreadColor;
  final String? fontFamily;
  final double? wordSpacing, letterSpacing;
  final int? maxLine;
  final bool randomFlicker;
  final int flickerTime;
  final TextOverflow? overflow;

  @override
  State<StatefulWidget> createState() {
    return NeonFlickerTextState();
  }
}

class NeonFlickerTextState extends State<NeonFlickerText>
    with TickerProviderStateMixin {
  late AnimationController controller;
  int randomNumber = Random().nextInt(3000);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
          milliseconds:
              widget.randomFlicker ? randomNumber : widget.flickerTime),
      vsync: this,
    );
    controller.addStatusListener((status) {
      randomNumber = Random().nextInt(widget.flickerTime);
      setState(() {});
      if (status == AnimationStatus.completed) {
        controller.repeat(
            reverse: true,
            period: Duration(
                milliseconds:
                    widget.randomFlicker ? randomNumber : widget.flickerTime));
      } else if (status == AnimationStatus.dismissed) {
        sleep(const Duration(milliseconds: 200));
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: controller.value > 0.5 ? widget.fontColor : Colors.white70,
        shadows: [
          Shadow(
            color: widget.spreadColor.withOpacity(controller.value),
            blurRadius: widget.blurRadius,
          ),
        ],
        fontFamily: widget.fontFamily,
        fontWeight: widget.fontWeight,
        fontSize: widget.fontSize,
        wordSpacing: widget.wordSpacing,
        letterSpacing: widget.letterSpacing,
      ),
      maxLines: widget.maxLine,
      overflow: widget.overflow,
    );
  }
}
