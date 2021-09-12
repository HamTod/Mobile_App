import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/pages/game/game.dart';


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
  bool newGame = false;

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
      body: Container(
        //color: Colors.amber.shade100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_btf.jpg"),
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
          image: AssetImage('assets/images/123.png'),
          width: 240.0, // 160 = 1 inch
        ),
        Text('GUESS THE NUMBER', style: GoogleFonts.kanit(fontSize: 20)),
      ],
    );
  }

  Widget _buildMainContent() {
    return _guessNumber == null
        ? SizedBox.shrink()
        : Column(
          children: [
            Text(_guessNumber!, style: GoogleFonts.kanit(fontSize: 150.0)),
            Text(_feedback!, style: GoogleFonts.kanit(fontSize: 50.0)),
            newGame == true
                ? TextButton(
                  onPressed: () {
                    _game = Game();
                  },
                  child: Text('NEW GAME',
                    style: TextStyle(color: Colors.white),),
                ): Column(),
          ],
    );
  }

  Widget _buildInputPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 10.0),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _guessNumber = _controller.text;
                      int? guess = int.tryParse(_guessNumber!);
                      if (guess != null) {
                        var result = _game.doGuess(guess);
                        if (result == 0) {
                          //ทายถูก
                          newGame = true;
                          _feedback = 'CORRECT!';
                        } else if (result == 1) {
                          //ทายมากไป
                          _feedback = 'TOO HIGH!';
                        } else {
                          //ทายน้อยไป
                          _feedback = 'TOO LOW!';
                        }
                      }else{
                        _feedback = 'Please enter a number';
                      }
                    });
                  },
                  child: Text(' GUESS', style: TextStyle(color: Colors.deepPurple),)),
            ],
          ),
        ),
      ),
    );
  }
}



