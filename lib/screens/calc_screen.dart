import 'package:calculator_app/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String inputs = '';
  String answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F2333),
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.topRight,
                  child: Text(
                    inputs,
                    style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    answer,
                    style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              CalculatorButton(
                buttonLabel: "v",
                buttonOnPressed: () {

                },
              ),
              CalculatorButton(
                buttonLabel: "c",
                buttonOnPressed: () {
                  setState(() {
                    inputs = "";
                    answer = "0";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "*",
                buttonOnPressed: () {
                  setState(() {
                    inputs += '*';
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "/",
                buttonOnPressed: () {
                  setState(() {
                    inputs += '/';
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                buttonLabel: "(",
                buttonOnPressed: () {
                  setState(() {
                    inputs += '(';
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: ")",
                buttonOnPressed: () {
                  setState(() {
                    inputs += ')';
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "%",
                buttonOnPressed: () {
                  setState(() {
                    inputs += '%';
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "*",
                buttonOnPressed: () {
                  setState(() {
                    inputs += '*';
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                buttonLabel: "1",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "1";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "2",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "2";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "3",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "3";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "-",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "-";
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                buttonLabel: "4",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "4";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "5",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "5";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "6",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "6";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "+",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "+";
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                buttonLabel: "7",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "7";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "8",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "8";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "9",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "9";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "=",
                buttonOnPressed: (){
                  setState(() {
                    calculateAns();

                  });
                },
              ),

            ],
          ),
          Row(
            children: [
              CalculatorButton(
                buttonLabel: "0",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "0";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: "00",
                buttonOnPressed: (){
                  setState(() {
                    inputs += "00";
                  });
                },
              ),
              CalculatorButton(
                buttonLabel: ".",
                buttonOnPressed: (){
                  setState(() {
                    inputs += ".";
                  });
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
  void calculateAns() {
    Parser p = Parser();
    Expression expression = p.parse(inputs);
    ContextModel cm = ContextModel();
    double result = expression.evaluate(EvaluationType.REAL, cm);
    answer = result.toString();
  }
}
