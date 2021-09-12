import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OlympicBoxingScoring extends StatefulWidget {
  const OlympicBoxingScoring({Key? key}) : super(key: key);

  @override
  _OlympicBoxingScoringState createState() => _OlympicBoxingScoringState();
}

class _OlympicBoxingScoringState extends State<OlympicBoxingScoring> {
  var scoreListRed = [];
  var scoreListBlue = [];
  var totalRed = 0;
  var totalBlue = 0;
  var count = 0;

  @override
  Widget build(BuildContext context) {
    var icon = 60.0;
    String head = "olympic boxing scoring";
    var top = Padding(
      padding: EdgeInsets.all(20.0),
      child: Image(
        image: AssetImage("assets/images/logo.png"),
        height: 50,
      ),
    );
    var match = Container(
      color: Colors.black,
      child: Center(
        child: Text(
          "Women's light (57-60 kg) semi-final",
          style: TextStyle(backgroundColor: Colors.black, color: Colors.white),
        ),
      ),
    );
    var red = Row(
      children: [
        Icon(
          Icons.person,
          color: Colors.red[900],
          size: icon,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage("assets/images/flag_ireland.png"),
                  width: 30,
                ),
                Text("  ireland".toUpperCase())
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
    var blue = Row(
      children: [
        Icon(
          Icons.person,
          color: Colors.blue[900],
          size: icon,
        ),
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
                Text("  thailand".toUpperCase())
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
              height: 10,
              color: Colors.red[900],
            )),
        Expanded(
            child: Container(
              height: 10,
              color: Colors.blue[900],
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
                    Center(child: Text("round ${i + 1}".toUpperCase())),
                    Row(
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                                  "${scoreListRed[i]}",
                                  style: TextStyle(fontSize: 20),
                                ))),
                        Expanded(
                            child: Center(
                                child: Text(
                                  "${scoreListBlue[i]}",
                                  style: TextStyle(fontSize: 20),
                                ))),
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      height: 1,
                    ),
                  ],
                ),
              ),
            count == 3
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(child: Text("Total".toUpperCase())),
                  Row(
                    children: [
                      Expanded(
                          child: Center(
                              child: Text(
                                "$totalRed",
                                style: TextStyle(fontSize: 20),
                              ))),
                      Expanded(
                          child: Center(
                              child: Text(
                                "$totalBlue",
                                style: TextStyle(fontSize: 20),
                              ))),
                    ],
                  ),
                  Container(
                    color: Colors.black,
                    height: 1,
                  )
                ],
              ),
            )
                : Container()
          ],
        ));
    var bot = count == 3
        ? Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          reset();
        },
        child: Icon(
          Icons.clear,
          color: Colors.white,
        ),
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
              style: ElevatedButton.styleFrom(primary: Colors.red[900]),
            ),
          )),
      Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _pressButton(false);
              },
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue[900]),
            ),
          )),
    ]);
    return Scaffold(
        appBar: AppBar(
          title: Text(head.toUpperCase()),
          backgroundColor: Colors.red[700],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              top,
              match,
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: red,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: blue,
              ),
              line,
              score,
              bot
            ],
          ),
        ));
  }

  void _pressButton(bool win) {
    setState(() {
      if (win) {
        totalBlue += 9;
        totalRed += 10;
        scoreListRed.add(10);
        scoreListBlue.add(9);
      } else {
        scoreListRed.add(9);
        scoreListBlue.add(10);
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
      scoreListBlue = [];
      scoreListRed = [];
    });
  }
}