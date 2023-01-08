// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_local_variable

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var firstNum = 0.0;
  var SecondNum = 0.0;
  var oper = " ";
  var output = "";
  var input = "";
  var hideValue = false;

  onClickButton(value) {
    if (value == "C") {
      output = "";
      input = "";
    } else if (value == "⌫") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var UserInput = input;
        UserInput = input.replaceAll("×", "*");
        Parser p = Parser();
        Expression expression = p.parse(UserInput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
          // log("${output}");
        }
        input = output;
        hideValue = true;
      }
    } else {
      input = input + value;
      hideValue = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text("Calcultor!"),
      // ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SingleChildScrollView(
                child: Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.all(40)),
                    Text(
                      hideValue ? output : input,
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      hideValue ? "" : output,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 46.9),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color.fromARGB(255, 24, 23, 23),
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(
                                text: "C", //BgColor: Colors.red
                                textColor: Colors.blue),
                            Button(
                                text: "/", //BgColor: Colors.red
                                textColor: Colors.blue),
                            Button(
                                text: "×",
                                TextSize: 42.0, //BgColor: Colors.red
                                textColor: Colors.blue),
                            Button(
                                text: "⌫",
                                TextSize: 30.0, //BgColor: Colors.blue
                                textColor: Colors.blue),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(text: "7"),
                            Button(text: "8"),
                            Button(text: "9"),
                            Button(
                                text: "-",
                                TextSize: 40.0,
                                textColor: Colors.blue
                                //BgColor: Colors.blue
                                ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(text: "4"),
                            Button(text: "5"),
                            Button(text: "6"),
                            Button(text: "%", textColor: Colors.blue
                                //textColor: Colors.blue,
                                //BgColor: Colors.blue
                                ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(text: "1"),
                            Button(text: "2"),
                            Button(text: "3"),
                            Button(
                                text: "+",
                                //BgColor: Colors.blue,
                                textColor: Colors.blue),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Button(text: "00", TextSize: 25.0),
                            Button(text: "0"),
                            Button(text: "."),
                            Button(
                              text: "=",
                              BgColor: Color.fromARGB(255, 5, 82, 145),
                            ),
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Button(
      {text,
      textColor = Colors.white,
      BgColor = Colors.black87,
      TextSize = 35.0}) {
    return Expanded(
      child: Container(
        // color: Color.fromARGB(255, 15, 15, 15),
        // elevation: 20,
        margin: EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: () {
            onClickButton(text);
          },
          // ignore: sort_child_properties_last
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: TextSize,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          style: ElevatedButton.styleFrom(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(100)),
              shape: CircleBorder(),
              primary: BgColor,
              padding: EdgeInsets.all(25)),
        ),
      ),
    );
  }
}
