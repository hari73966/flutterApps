import 'package:flutter/material.dart';
import 'package:dice/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});
  final Color color1;
  final Color color2;
  void rollDice() {
    // ...
  }
  @override
  Widget build(context) {
    return

        /// The `Container` widget in the provided code is defining a visual container that has a
        /// gradient background. Here's a breakdown of what each part of the code snippet is
        /// doing:
        Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
