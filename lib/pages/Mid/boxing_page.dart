import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

class BoxingGame extends StatefulWidget {
  const BoxingGame({Key? key}) : super(key: key);

  @override
  _BoxingGameState createState() => _BoxingGameState();
}

class _BoxingGameState extends State<BoxingGame> {
  var List_scoreRed = [];
  var List_scoreBlue = [];
  var totalRed = 0;
  var totalBlue = 0;
  var count = 0;
  var icon = 55.0;
  //Color(0xFFA00000) แดง
  //Color(0xFF0000A0) น้ำเงิน
  @override
  Widget build(BuildContext context) {

    var top = Padding(
      padding: EdgeInsets.all(20.0),
      child: Image(
        image: AssetImage("assets/images/logo.png"),
        height: 60.0,
      ),
    );

    var match = Container(
      color: Colors.black,
      child: Center(
        child: Text(
          "Women's light (57-60 kg) Semi-final",
          style: TextStyle(backgroundColor: Colors.black, color: Colors.white),
        ),
      ),
    );

    var ireland = Row(
      children: [
        Icon(
          Icons.person,color: Color(0xFFA00000),size: icon,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage("assets/images/flag_ireland.png"),
                  width: 40,
                ),
                Text("  ICELAND")
              ],
            ),
            Text("HARRINGTON Kellie Anne")
          ],
        ),
        count == 3 && totalRed > totalBlue
            ? Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.check,color: Colors.green,),
                ],
              ),
        )
            : Container()
      ],
    );
    var thailand = Row(
      children: [
        Icon( Icons.person,color: Color(0xFF0000A0),size: icon,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage("assets/images/flag_thailand.png"),
                  width: 30,
                ),
                Text("  THAILAND")
              ],
            ),
            Text("SEESONDEE Sudaporn")
          ],
        ),
        count == 3 && totalBlue > totalRed
            ? Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                ],
              ),
            )
            : Container()
      ],
    );
    var line = Row(
      children: [
        Expanded(
            child: Container(
              height: 15,
              color: Color(0xFFA00000),
            )),
        Expanded(
            child: Container(
              height: 15,
              color: Color(0xFF0000A0),
            )),
      ],
    );
    var score = Expanded(
        child: Column(
          children: [
            for (int i = 0; i < count; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text("ROUND ${i + 1}")),
                    Row(
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                                  "${List_scoreRed[i]}",
                                  style: TextStyle(fontSize: 20),
                                ))),
                        Expanded(
                            child: Center(
                                child: Text(
                                  "${List_scoreBlue[i]}",
                                  style: TextStyle(fontSize: 20),
                                ))),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness:1,
                    ),
                  ],
                ),
              ),
            count == 3
                ? Padding(
              padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(child: Text("TOTAL")),
                    Row(
                      children: [
                        Expanded(
                            child: Center(
                                child: Text( "$totalRed",style: TextStyle(fontSize: 20), ))),
                        Expanded(
                            child: Center(
                                child: Text("$totalBlue",style: TextStyle(fontSize: 20), ))),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness:1,
                    ),
                  ],
                ),
            )
                : Container()
          ],
        ));
    var check = count == 3
        ? Padding(
          padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  reset();
                },
                child: Icon(Icons.clear,color: Colors.white,),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                ),
              ),
      )
        : Row(children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _pressButton(true);
                  },
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(primary: Color(0xFFA00000)),
                ),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _pressButton(false);
                  },
                  child: Icon(Icons.person,color: Colors.white,),
                  style: ElevatedButton.styleFrom(primary:Color(0xFF0000A0)),
                ),
              )),
        ]);
    return Scaffold(
        appBar: AppBar(
          title: Text('OLYMPIC BOXING SCORING'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              top,
              match,
              Padding(padding: const EdgeInsets.all(2.0),
                child: ireland,
              ),
              Padding(padding: const EdgeInsets.all(2.0),
                child: thailand,
              ),
              line,
              score,
              check
            ],
          ),
        ));
  }

  void _pressButton(bool win) {
    setState(() {
      if (win) {
        totalBlue += 9;
        totalRed += 10;
        List_scoreRed.add(10);
        List_scoreBlue.add(9);
      } else {
        List_scoreRed.add(9);
        List_scoreBlue.add(10);
        totalBlue += 10;
        totalRed += 9;
      }
      count++;
    });
  }

  void reset() {
    setState(() {
      totalBlue = 0;
      totalRed = 0;
      count = 0;
      List_scoreBlue = [];
      List_scoreRed = [];
    });
  }
}

  /*
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OLYMPIC BOXING SCORING'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                width: 250.0,
              ),
            ),
            Row(

              children: [
                Expanded(child: Text(
                  "Women's light (57-60 kg) semi-final",
                  style: TextStyle(backgroundColor: Colors.black, color: Colors.white),
                ),)
              ],


            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 60.0,
                  color: Color(0xFFA00000),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/flag_ireland.png'),
                          width: 30.0,
                        ),
                        Text(
                          ' IRELAND',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Text(
                      'HARRINGTON Kellie Anne',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 60.0,
                  color: Color(0xFF0000A0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image:
                          AssetImage('assets/images/flag_thailand.png'),
                          width: 30.0,
                        ),
                        Text(
                          ' THAILAND',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Text(
                      'SEESONDEE Sudaporn',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xFFA00000),
                    height: 10.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFF0000A0),
                    height: 10.0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.teal.shade100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFA00000),
                    fixedSize: Size(185, 40),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 30.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0000A0),
                    fixedSize: Size(185, 40),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
}

  }

*/