import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHome();
  }
}

class MyHome extends State<MyApp> {
  var disp = "";
  var comp = List();
  var x = 0.0;
  var n = 0;

  processing() {
    var operators = List();
    var operands = List();

    for (int i = 0; i < comp.length; ++i) {
      if (comp[i] is double) {
        if (i != 0) {
          if (comp[i - n - 1] == ".") {
            x = x + (comp[i] / pow(10, n + 1));
            ++n;
          } else
            x = x * 10.0 + comp[i];
        } else
          x = x * 10.0 + comp[i];
      } else {
        if (comp[i] != ".")
        {
          operands.add(x);
          operators.add(comp[i]);
          x = 0;
        }
        n = 0;
      }
    }

    operands.add(x); 

    for (int i = 0; i < operators.length; ++i) {
      if (operators[i] == "+") operands[i + 1] = operands[i] + operands[i + 1];
      if (operators[i] == "-") operands[i + 1] = operands[i] - operands[i + 1];
      if (operators[i] == "*") operands[i + 1] = operands[i] * operands[i + 1];
      if (operators[i] == "/") operands[i + 1] = operands[i] / operands[i + 1];
      if (operators[i] == "^") operands[i + 1] = pow(operands[i], operands[i + 1]);
    }

    x = 0.0;
    
    if (operands.length - operators.length == 1)
    return operands[operands.length - 1];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("The simple calculator"),
            ),
            backgroundColor: Colors.orange,
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Display(
                        data: disp,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            RaisedButton(
                              onPressed: () => setState(() {
                                disp = disp + ".";
                                comp.add(".");
                              }),
                              padding: EdgeInsets.only(
                                  right: 45, bottom: 40, top: 40, left: 45),
                              child: Text(
                                ".",
                                textScaleFactor: 3,
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            RaisedButton(
                              onPressed: () => setState(() {
                                disp = disp + "÷";
                                comp.add("/");
                              }),
                              padding: EdgeInsets.all(40),
                              child: Text(
                                "÷",
                                textScaleFactor: 3,
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            RaisedButton(
                              onPressed: () => setState(() {
                                disp = disp + "x";
                                comp.add("*");
                              }),
                              padding: EdgeInsets.only(
                                  right: 42, bottom: 40, top: 40, left: 40),
                              child: Text(
                                "x",
                                textScaleFactor: 3,
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ]),
                          Row(
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () => setState(() {
                                  disp = disp + "1";
                                  comp.add(1.0);
                                }),
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  "1",
                                  textScaleFactor: 3,
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              RaisedButton(
                                onPressed: () => setState(() {
                                  disp = disp + "2";
                                  comp.add(2.0);
                                }),
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  "2",
                                  textScaleFactor: 3,
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              RaisedButton(
                                onPressed: () => setState(() {
                                  disp = disp + "3";
                                  comp.add(3.0);
                                }),
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  "3",
                                  textScaleFactor: 3,
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () => setState(() {
                                  disp = disp + "4";
                                  comp.add(4.0);
                                }),
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  "4",
                                  textScaleFactor: 3,
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              RaisedButton(
                                onPressed: () => setState(() {
                                  disp = disp + "5";
                                  comp.add(5.0);
                                }),
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  "5",
                                  textScaleFactor: 3,
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              RaisedButton(
                                onPressed: () => setState(() {
                                  disp = disp + "6";
                                  comp.add(6.0);
                                }),
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  "6",
                                  textScaleFactor: 3,
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () => setState(() {
                                  disp = disp + "7";
                                  comp.add(7.0);
                                }),
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  "7",
                                  textScaleFactor: 3,
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              RaisedButton(
                                onPressed: () => setState(() {
                                  disp = disp + "8";
                                  comp.add(8.0);
                                }),
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  "8",
                                  textScaleFactor: 3,
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              RaisedButton(
                                onPressed: () => setState(() {
                                  disp = disp + "9";
                                  comp.add(9.0);
                                }),
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  "9",
                                  textScaleFactor: 3,
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () => setState(() {
                                    disp = disp + "0";
                                    comp.add(0.0);
                                  }),
                                  padding: EdgeInsets.only(
                                      left: 145,
                                      right: 145,
                                      bottom: 20,
                                      top: 20),
                                  child: Text(
                                    "0",
                                    textScaleFactor: 3,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.orange),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ]),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () => setState(() {
                              disp = "";
                              comp.clear();
                            }),
                            padding: EdgeInsets.only(left: 42.5, right: 40, bottom: 45, top: 37),
                            child: Text(
                              "C",
                              textScaleFactor: 2.86,
                            ),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          RaisedButton(
                            onPressed: () => setState(() {
                              disp = disp + "^";
                              comp.add("^");
                            }),
                            padding: EdgeInsets.only(left: 46, right: 45.5, top: 40, bottom: 42),
                            child: Text(
                              "^",
                              textScaleFactor: 2.86,
                            ),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(5)),
                          ),                          
                          RaisedButton(
                            onPressed: () => setState(() {
                              disp = disp + "+";
                              comp.add("+");
                            }),
                            padding: EdgeInsets.only(
                                bottom: 40, top: 40, left: 45, right: 40),
                            child: Text(
                              "+",
                              textScaleFactor: 3,
                            ),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          RaisedButton(
                            onPressed: () => setState(() {
                              disp = disp + "-";
                              comp.add("-");
                            }),
                            padding: EdgeInsets.only(
                                left: 47, right: 43, top: 31, bottom: 32),
                            child: Text(
                              "-",
                              textScaleFactor: 4,
                            ),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          RaisedButton(
                            onPressed: () => setState(() {
                              var res = processing();
                              disp = "$res";
                            }),
                            padding: EdgeInsets.only(left: 43, right: 42, bottom: 20, top: 20),
                            child: Text(
                              "=",
                              textScaleFactor: 3,
                            ),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ],
                      )
                    ],
                  )
                ]))));
  }
}

class Display extends StatelessWidget {
  var data;
  Display({this.data});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(right: 20, bottom: 20, left: 20, top: 20),
      color: Colors.lightBlue[100],
      child: Align(
        alignment: Alignment.center,
        child: Text(
          '$data',
          textScaleFactor: 3,
          textAlign: TextAlign.center,
        ),
      ),
      height: 150,
      width: 360,
    );
  }
}