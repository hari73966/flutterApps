import 'dart:math';

import 'package:flutter/material.dart';

/// The above class represents a dice roller widget in Dart that extends StatefulWidget.
/// `final randomizer = Random();` is creating an instance of the `Random` class from the `dart:math`
/// library. This instance will be used to generate random numbers for simulating dice rolls in the
/// `DiceRoller` widget. The `nextInt(6) + 1` method is then called on this `randomizer` instance to
/// generate a random number between 1 and 6, simulating a dice roll.
final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      /// The line `currentDiceRoll = randomizer.nextInt(6) + 1;` in the `_DiceRollerState` class of the
      /// `DiceRoller` widget is generating a random number between 1 and 6 to simulate a dice roll.
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      /// The `mainAxisSize: MainAxisSize.min` property in the `Column` widget of the `build` method is
      /// used to control the size of the column along its main axis, which is the vertical axis in this
      /// case.
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(
            //   top: 20,
            // ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
