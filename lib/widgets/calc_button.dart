import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton(
      {super.key, required this.buttonLabel, required this.buttonOnPressed, this.color});

  final String buttonLabel;
  final Color? color;
  final Function buttonOnPressed;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .25,
      height: size.height * .098,
      child: Material(
        color: widget.color ?? const Color(0xff0C344F),
        child: InkWell(
          onTap: () {
            widget.buttonOnPressed();
          },
          child: Center(
            child: Text(
              widget.buttonLabel,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}