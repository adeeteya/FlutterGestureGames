import 'package:flutter/material.dart';

class NeonContainer extends StatefulWidget {
  const NeonContainer({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.containerColor,
    this.borderWidth = 5,
    this.borderColor = Colors.white,
    this.borderRadius = BorderRadius.zero,
    this.spreadColor = Colors.deepPurple,
    this.lightSpreadRadius = 10,
    this.lightBlurRadius = 60,
    this.alignment,
    this.clipBehaviour = Clip.antiAlias,
    this.child,
  }) : super(key: key);

  final Color borderColor;
  final Color spreadColor;
  final Color? containerColor;
  final BorderRadius borderRadius;
  final Clip clipBehaviour;
  final EdgeInsets? margin, padding;
  final double borderWidth;
  final double lightSpreadRadius;
  final double lightBlurRadius;
  final double? width, height;
  final Alignment? alignment;
  final Widget? child;

  @override
  State<StatefulWidget> createState() {
    return NeonContainerState();
  }
}

class NeonContainerState extends State<NeonContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      clipBehavior: widget.clipBehaviour,
      alignment: widget.alignment,
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: widget.borderRadius,
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.spreadColor,
            blurRadius: widget.lightBlurRadius, // soften the shadow
            spreadRadius: widget.lightSpreadRadius,
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
