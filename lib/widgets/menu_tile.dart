import 'package:flutter/material.dart';
import 'package:gesture_games/widgets/neon/neon_container.dart';
import 'package:gesture_games/widgets/neon/neon_text.dart';

class MenuTile extends StatelessWidget {
  const MenuTile(
      {Key? key,
      required this.name,
      required this.onTap,
      this.textColor = Colors.pink})
      : super(key: key);
  final String name;
  final VoidCallback onTap;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: NeonContainer(
        height: 75,
        margin: const EdgeInsets.only(bottom: 20),
        containerColor: const Color(0xFF1F1930),
        borderWidth: 2,
        borderColor: Colors.pink,
        borderRadius: BorderRadius.circular(12),
        lightSpreadRadius: 0,
        lightBlurRadius: 10,
        alignment: Alignment.center,
        child: NeonText(
          name,
          fontSize: 22,
          spreadColor: textColor,
        ),
      ),
    );
  }
}
