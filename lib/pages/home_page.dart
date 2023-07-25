import 'dart:io';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var inputa;
  var outputa;
  HomePage({this.inputa, this.outputa, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double fistNumber = 0.0;
  double sceondNumber = 0.0;
  var input = "";
  var output = "0";
  var operation = "";
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    if (value == "AC") {
      input = "";

      output = "0";
    } else if (value == "C") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input.replaceAll("X", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel contextModel = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, contextModel);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 35.0;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 30;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Confirmation"),
                content: Text("Are you suru exit."),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.orange)),
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.orange)),
                          onPressed: () {
                            exit(0);
                          },
                          child: Text("Yes",
                              style: TextStyle(color: Colors.black))),
                    ],
                  )
                ],
              );
            }));
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Container(
              height: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: orientation == Orientation.portrait ? 10.0 : 2.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            hideInput ? "" : input,
                            style: TextStyle(fontSize: 34, color: Colors.white),
                          ),
                          Text(
                            output,
                            style: TextStyle(
                                fontSize: outputSize, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CostomButtoms(
                              "AC",
                              Colors.orange,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "C",
                              Colors.orange,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "(",
                              Colors.blueGrey,
                              Colors.white,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              ")",
                              Colors.blueGrey,
                              Colors.white,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "/",
                              Colors.blueGrey,
                              Colors.white,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CostomButtoms(
                              "7",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "8",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "9",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "X",
                              Colors.blueGrey,
                              Colors.white,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CostomButtoms(
                              "4",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "5",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "6",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "-",
                              Colors.blueGrey,
                              Colors.white,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CostomButtoms(
                              "1",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "2",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "3",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "+",
                              Colors.blueGrey,
                              Colors.white,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CostomButtoms(
                              "0",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "00",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              ".",
                              Colors.grey,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                            CostomButtoms(
                              "=",
                              Colors.orange,
                              Colors.black,
                              orientation == Orientation.portrait ? 20.0 : 8.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CostomButtoms(text, bgcolor, buttomColor, bottonSize) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(1),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(bottonSize),
                  primary: bgcolor,
                ),
                onPressed: () => onButtonClick(text),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 20,
                      color: buttomColor,
                      fontWeight: FontWeight.bold),
                ))));
  }
}
