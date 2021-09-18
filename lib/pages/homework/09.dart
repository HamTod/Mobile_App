// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hello/pages/game/game.dart';
//
//
//
// class GamPage extends StatefulWidget {
//   const GamPage({Key? key}) : super(key: key);
//
//   @override
//   _GamPageState createState() => _GamPageState();
// }
//
// class _GamPageState extends State<GamPage> {
//   late Game _game;
//   final TextEditingController _controller = TextEditingController();
//   String startGame =
//       "I'm thinking of a number \n between 1 and 100. \n\n Can You guess it? ❤";
//   String? _guessNumber;
//   String? _feedBack;
//
//
//   @override
//   void initState() {
//     _game = Game();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("GUESS THE NUMBER"),
//       ),
//       body: Container(
//         color: Colors.yellow.shade100,
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildHeader(),
//                 buildMainContent(),
//                 buildInputPanel(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Column(
//       children: [
//         Image.asset(
//           'assets/images/header.png',
//           width: 240.0, // 160 = 1 inch
//         ),
//         Text(
//           'Guess The Number',
//           style:
//           GoogleFonts.prompt(fontSize: 22.0, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
//
//   Widget buildMainContent() {
//     return _guessNumber == null && _feedBack == null
//         ? Center(
//       child: Text(
//         startGame,
//         style: GoogleFonts.kanit(
//           fontSize: 22.0,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     )
//         : Column(
//       children: [
//         Center(
//             child: Text(
//               _guessNumber!,
//               style: GoogleFonts.kanit(fontSize: 80.0),
//               textAlign: TextAlign.center,
//             )),
//         Center(
//             child: Text(
//               _feedBack!,
//               style: GoogleFonts.kanit(fontSize: 30.0),
//               textAlign: TextAlign.center,
//             )),
//         _feedBack == "CORRECT"
//             ? Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _game = Game();
//                   _guessNumber = null;
//                   _feedBack = null;
//                 });
//                 ;
//               },
//               child: Text("New Game")),
//         )
//             : SizedBox()
//       ],
//     );
//   }
//
//   Widget buildInputPanel() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Flexible(
//           child: TextField(
//             keyboardType: TextInputType.number,
//             controller: _controller,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.teal, width: 10.0),
//               ),
//             ),
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             setState(() {
//               _guessNumber = _controller.text;
//               int? guess = int.tryParse(_guessNumber!);
//               if (guess != null) {
//                 _controller.clear();
//                 int result = _game.doGuess(guess);
//                 if (result == 0) {
//                   _showMaterialDialog();
//                   _feedBack = "✔ CORRECT!";
//                   print(_game.answer);
//                 } else if (result == 1) {
//                   _feedBack = "🔺 TOO HIGH!";
//                 } else {
//                   _feedBack = "🔻 TOO LOW!";
//                 }
//
//               }
//
//             });
//           },
//           child: Text('GUESS'),
//         ),
//       ],
//     );
//   }
//
//   void _showMaterialDialog() {
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//
//         return AlertDialog(
//           title: Text("GOOD JOB!"),
//           content: Text("The answer is ${_game.answer} \nYou have made ${_game.totalGuesses} guesses. \n\n${_game.toString().toString()}"),
//           actions: [
//             // ปุ่ม OK ใน dialog
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 // ปิด dialog
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }