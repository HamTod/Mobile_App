//hw5
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool showNumber = true;
  bool endGame = false;
  var i = 0;
  bool blue = true;
  var star = 0;

  _newGame() {
    setState(() {
      i = 0;
      star = 0;
      showNumber = true;
      blue = true;
      endGame = false;
    });
  }

  _handleClickButton1() {
    setState(() {
      i = i + 1;
      star += 1;
      showNumber = !showNumber;
      blue = !blue;
      if (i >= 20) endGame = !endGame;
    });
  }

  _handleClickButton2() {
    setState(() {
      i = i + 2;
      star += 2;
      showNumber = !showNumber;
      blue = !blue;
      if (i >= 20) endGame = !endGame;
    });
  }

  _handleClickButton3() {
    setState(() {
      i = i + 3;
      star += 3;
      showNumber = !showNumber;
      blue = !blue;
      if (i >= 20) endGame = !endGame;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> iconList = [];
    for (var j = 0; j < star; j++) {
      iconList.add(Icon(
        Icons.star,
        color: Colors.deepPurple,
        size: 25.0,
      ));
    }
    for (var i = 0; i < (20 - star); i++) {
      iconList.add(Icon(
        Icons.star_border,
        color: Colors.deepPurple,
        size: 25.0,
      ));
    }

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage('assets/images/cat_glasses.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Container(
              child: !endGame
                  ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    !showNumber
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _handleClickButton3,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('3',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: _handleClickButton2,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('2',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: _handleClickButton1,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('1',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('3',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('2',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('1',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [for (var item in iconList) item],
                          ),
                          Column(
                            children: [
                              !showNumber
                                  ? Icon(
                                Icons.keyboard_arrow_up,
                                size: 100.0,
                                color: Colors.pink,
                              )
                                  : Icon(
                                Icons.keyboard_arrow_up,
                                size: 100.0,
                                color: Colors.grey.shade400,
                              ),
                              Text(i.toString(),
                                  style: TextStyle(fontSize: 150.0)),
                              !showNumber
                                  ? Icon(
                                Icons.keyboard_arrow_down,
                                size: 100.0,
                                color: Colors.grey.shade400,
                              )
                                  : Icon(
                                Icons.keyboard_arrow_down,
                                size: 100.0,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(width: 25.0),
                        ],
                      ),
                    ),
                    showNumber
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _handleClickButton1,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('1',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: _handleClickButton2,
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              fixedSize: Size(110, 50)),
                          child: Text('2',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: _handleClickButton3,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('3',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('1',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('2',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('3',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                      ],
                    ),
                  ],
                ),
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('3',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('2',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('1',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            !blue
                                ? Text('RED',
                                style: TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black
                                              .withOpacity(0.3),
                                          offset: Offset(10, 10),
                                          blurRadius: 15),
                                    ]))
                                : Text('BLUE',
                                style: TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black
                                              .withOpacity(0.3),
                                          offset: Offset(10, 10),
                                          blurRadius: 15),
                                    ])),
                            Text('WIN!',
                                style: TextStyle(
                                    fontSize: 60.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black
                                              .withOpacity(0.3),
                                          offset: Offset(10, 10),
                                          blurRadius: 15),
                                    ])),
                            SizedBox(height: 20.0),
                            OutlinedButton(
                              onPressed: _newGame,
                              child: Text('NEW GAME',
                                  style: TextStyle(fontSize: 15.0)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('1',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('2',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade400,
                            fixedSize: Size(110, 50),
                          ),
                          child: Text('3',
                              style: TextStyle(fontSize: 30.0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}