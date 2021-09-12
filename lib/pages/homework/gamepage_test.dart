import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TwentyGame extends StatefulWidget {
  const TwentyGame({Key? key}) : super(key: key);

  @override
  _TwentyGameState createState() => _TwentyGameState();
}

class _TwentyGameState extends State<TwentyGame> {
  var count = 0;
  var turn = "blue";

  @override
  Widget build(BuildContext context) {
    var r = Random();
    var blue = Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: turn == "blue" && count < 20 ? () {
                press(1);
              } : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text(
                '1',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: turn == "blue" && count < 20 ? () {
                press(2);
              } : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text(
                '2',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: turn == "blue" && count < 20 ? () {
                press(3);
              } : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text(
                '3',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
        ),
      ],
    );
    var red = Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: turn == "red" && count < 20 ? () {
                press(3);
              } : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                '3',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: turn == "red" && count < 20 ? () {
                press(2);
              } : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                '2',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: turn == "red" && count < 20 ? () {
                press(1);
              } : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                '1',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
        ),
      ],
    );
    var star = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      List.generate(20, (index) {
        return Icon(
          index < count ? Icons.star : Icons.star_border,
          color: Colors.purple,
        );
      }),
    );
    var arrow = 100.0;
    var mid = Row(
      children: [
        if (count < 20) star,
        Expanded(
          child: Center(
            child: Column(
              children: [
                if (count < 20) Icon(Icons.keyboard_arrow_up, size: arrow,
                  color: turn == "red" ? Colors.red : Colors.red,),
                count < 20
                    ? Text("$count", style: TextStyle(fontSize: arrow),)
                    : Column(
                  children: [
                    Text(turn == "red" ? "Red\nwin!" : "Blue\nwin !",
                        style: TextStyle(
                            fontSize: arrow, fontWeight: FontWeight.bold,color: Colors.deepPurple)),
                    TextButton(onPressed: rest,
                        child: Text(
                          "New Game", style: TextStyle(color: Colors.blue),))
                  ],
                ),
                if (count < 20) Icon(Icons.keyboard_arrow_down, size: arrow,
                  color: turn == "blue" ? Colors.blue : Colors.blue,)
              ],
            ),
          ),
        )
      ],
    );

    return Scaffold(
        body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: const DecorationImage(
                  image: const AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [red, mid, blue],
              ),
            )));
  }

  void press(int i) {
    setState(() {
      count += i;
      turn == "blue" ? turn = "red" : turn = "blue";
    });
  }

  void rest() {
    setState(() {
      count = 0;
      turn = "blue";
    });
  }


}