import 'package:flutter/material.dart';
import 'package:calculator_app/constants.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton({super.key, required this.buttonLabel, required this.buttonOnPressed});

  final String buttonLabel;
  final buttonOnPressed;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
          style: outlinedButtonStyle,
          onPressed: widget.buttonOnPressed,
          child: Text(
            widget.buttonLabel,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),
          ),
      ),
    );
  }
}
