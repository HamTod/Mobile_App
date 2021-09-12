//hw5
import 'dart:math';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var num = Random().nextInt(100);

    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
      ),
      body: Container(
        color: Colors.amber.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person,
                  size: 80.0,
                  color: Colors.pinkAccent,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'สุภาพร คำชมภู',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 20.0,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          size: 20.0,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          size: 20.0,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          size: 20.0,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star_border,
                          size: 20.0,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '$num',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 170.0, color: Colors.orange),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('RANDOM'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}