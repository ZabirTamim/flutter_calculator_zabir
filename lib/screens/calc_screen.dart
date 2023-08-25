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
  bool percentClicked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff0F2333),
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            flex: 1,
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
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 1
                SizedBox(
                  // width: size.width*.4,
                  child: Column(
                    children: [
                      CalculatorButton(
                        buttonLabel: "v",
                        buttonOnPressed: () {
                          // setState(() {
                          //   inputs += 'v';
                          // });
                        },
                      ),
                      CalculatorButton(
                        buttonLabel: "(",
                        buttonOnPressed: () {
                          setState(() {
                            inputs += '(';
                          });
                        },
                      ),
                      CalculatorButton(
                        buttonLabel: "1",
                        buttonOnPressed: () {
                          setState(() {
                            inputs += '1';
                          });
                        },
                      ),
                      CalculatorButton(
                        buttonLabel: "4",
                        buttonOnPressed: () {
                          setState(() {
                            inputs += '4';
                          });
                        },
                      ),
                      CalculatorButton(
                        buttonLabel: "7",
                        buttonOnPressed: () {
                          setState(() {
                            inputs += '7';
                          });
                        },
                      ),
                      CalculatorButton(
                        buttonLabel: "0",
                        buttonOnPressed: () {
                          setState(() {
                            inputs += '0';
                          });
                        },
                      ),
                    ],
                  ),
                ),

                /// 2
                Column(
                  children: [
                    CalculatorButton(
                      buttonLabel: "c",
                      buttonOnPressed: () {
                        setState(() {
                          inputs = "";
                          answer = "0";
                          percentClicked = false;
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
                      buttonLabel: "2",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '2';
                        });
                      },
                    ),
                    CalculatorButton(
                      buttonLabel: "5",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '5';
                        });
                      },
                    ),
                    CalculatorButton(
                      buttonLabel: "8",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '8';
                        });
                      },
                    ),
                    CalculatorButton(
                      buttonLabel: "00",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '00';
                        });
                      },
                    ),
                  ],
                ),

                /// 3
                Column(
                  children: [
                    CalculatorButton(
                      buttonLabel: "X",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += 'X';
                        });
                      },
                    ),
                    CalculatorButton(
                      buttonLabel: "%",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '%';
                          percentClicked = true;
                        });
                      },
                    ),
                    CalculatorButton(
                      buttonLabel: "3",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '3';
                        });
                      },
                    ),
                    CalculatorButton(
                      buttonLabel: "6",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '6';
                        });
                      },
                    ),
                    CalculatorButton(
                      buttonLabel: "9",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '9';
                        });
                      },
                    ),
                    CalculatorButton(
                      buttonLabel: ".",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '.';
                        });
                      },
                    ),
                  ],
                ),

                /// 4
                Column(
                  children: [
                    CalculatorButton(
                      buttonLabel: "/",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '/';
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
                      buttonLabel: "-",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '-';
                        });
                      },
                    ),
                    CalculatorButton(
                      buttonLabel: "+",
                      buttonOnPressed: () {
                        setState(() {
                          inputs += '+';
                        });
                      },
                    ),
                    SizedBox(
                      height: size.width * .32,
                      child: CalculatorButton(
                        color: const Color(0xff286D98), // #286D98
                        buttonLabel: "=",
                        buttonOnPressed: () {
                          setState(() {
                            if (percentClicked){
                              calculatePercentage();
                            }
                            else{
                              calculateAns();
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void calculatePercentage() {
    List vars = inputs.split('%');
    int vl = vars.length;
    if (vars[0] == 0) {
      answer = "SYNTAX ERROR";
    }
    else if (vl > 2){
      answer = "SYNTAX ERROR";

    }
    else{
      double answerD = (double.parse(vars[0]) / double.parse(vars[1])) * 100.0;
      answer = answerD.toString();
    }
  }

  void calculateAns() {
    try {
      Parser p = Parser();
      Expression expression = p.parse(inputs);
      ContextModel cm = ContextModel();

      double result = expression.evaluate(EvaluationType.REAL, cm);

      answer = result.toString();
    } catch (e) {
      setState(() {
        answer = 'SYNTAX ERROR';
      });
    }
  }
}


