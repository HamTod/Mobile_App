import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/pages/game/game.dart';

import 'package:flutter/cupertino.dart';

class LongPage extends StatefulWidget {
  const LongPage({Key? key}) : super(key: key);

  @override
  _LongPageState createState() => _LongPageState();
}

class _LongPageState extends State<LongPage> {
  late Game _game;
  final _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;
  String str = 'I\'m thinking of number ';
  String str1 = 'between 1 and 100';
  String str2 = '★ Can you guess it? ★';
  bool newGame = false;

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.pressStart2p(fontSize: 16),
          ),
          content: Text(
            msg,
            style: GoogleFonts.pressStart2p(fontSize: 10),
          ),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER', style: GoogleFonts.pressStart2p()),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Container(
        //color: Colors.amber.shade100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(//รูป + ข้อความ
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/gokuu.png'),
          width: 240.0, // 160 = 1 inch
        ),
        Text('GUESS THE NUMBER', style: GoogleFonts.pressStart2p(color: Colors.white)),
      ],
    );
  }

  Widget _buildMainContent() {
    return _guessNumber == null
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(str, style: GoogleFonts.pressStart2p(fontSize: 15.0)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(str1, style: GoogleFonts.pressStart2p(fontSize: 15.0)),
            ),
            Text(str2, style: GoogleFonts.pressStart2p(fontSize: 15.0)),
          ],
        )
        //? SizedBox.shrink()
          : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_guessNumber!,
                    style: GoogleFonts.pressStart2p(
                        fontSize: 40, color: Colors.black)),
              ),
              Text(_feedback!, style: GoogleFonts.pressStart2p(fontSize: 20)),
              if (newGame)
                TextButton(
                    onPressed: () {
                      setState(() {
                        _game = Game();
                        newGame = false;
                        _guessNumber= null;
                        _feedback = null;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          //borderRadius: BorderRadius.circular(.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              color: Colors.amber,
                              spreadRadius: 3,
                              blurRadius: 5.0,
                            )
                          ],

                          border: Border.all(width: 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'NEW GAME',
                            style: GoogleFonts.pressStart2p(
                                fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                    )),
      ],
    );
  }

  Widget _buildInputPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orange.shade100,
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(5.0, 5.0),
              color: Colors.grey,
              spreadRadius: 3,
              blurRadius: 5.0,
            )
          ]

      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontFamily: 'PressStart2p',
                      color: Colors.blueAccent,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      isDense: true,
                      // กำหนดลักษณะเส้น border ของ TextField ในสถานะปกติ
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      // กำหนดลักษณะเส้น border ของ TextField เมื่อได้รับโฟกัส
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Enter the number here',
                      hintStyle: TextStyle(
                        fontFamily: 'PressStart2p',
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _guessNumber = _controller.text;
                      int? guess = int.tryParse(_guessNumber!);
                      if (guess != null) {
                        var result = _game.doGuess(guess);
                        var total = _game.totalGuesses;
                        if (result == 0) {
                          //ทายถูก
                          newGame = true;
                          _feedback = 'CORRECT!';
                          _showMaterialDialog('GOOD JOB',
                              'The answer is $_guessNumber\n\nYou have made ${_game.totalGuesses}\n\n ${_game.toString().toString()} ');
                          _controller.clear();
                        } else if (result == 1) {
                          //ทายมากไป
                          _feedback = 'TOO HIGH!';
                          _controller.clear();
                        } else {
                          //ทายน้อยไป
                          _feedback = 'TOO LOW!';
                          _controller.clear();
                        }
                      } else {
                        _feedback = '';
                        _showMaterialDialog('Error', 'Please enter the number');
                        _controller.clear();
                        newGame = false;
                      }
                    }
                    );
                  },
                child: Text(' GUESS',
                    style: GoogleFonts.pressStart2p(
                        fontSize: 12, color: Colors.black)),)
            ],
          ),
        ),
      ),
    );
  }
}



