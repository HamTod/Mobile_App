import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LongPage extends StatefulWidget {
  const LongPage({Key? key}) : super(key: key);

  @override
  _LongPageState createState() => _LongPageState();
}

class _LongPageState extends State<LongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('GUESS THE NUMBER'),
      // ),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/123.png',
                      width: 240.0, // 160 = 1 inch
                    ),
                    Text(
                      'GUESS THE NUMBER',
                      style: GoogleFonts.kanit(fontSize: 22.0),
                    ),
                  ],
                ),
                Text('TEST'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal, width: 10.0),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //
                      },
                      child: Text('GUESS'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }


