import 'dart:io';
import 'dart:math';
void main(){
  var game = Game();
  var isCorrect = false;
  do{
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!); //null ได้
    //var result = game.doGuess(50);

    if(guess != null){
      Map resultMap = game.doGuess(guess);
      isCorrect = resultMap['isCorrect'];
      var message = resultMap['text'];
      print(message);

    }
  }while(!isCorrect);

}
void _main() {
  const MAX_RANDOM = 100;

  print('╔═══════════════════════════════════════════════');
  print('║               GUESS THE NUMBER                ');
  print('╟───────────────────────────────────────────────');

  var r = Random();
  var answer = r.nextInt(MAX_RANDOM) + 1;

  var guess, isCorrect = false, totalGuesses = 0;
  do {
    stdout.write('║ Guess the number between 1 and $MAX_RANDOM: ');
    String? input = stdin.readLineSync();

    guess = int.tryParse(input!);
    if (guess != null) {
      totalGuesses++;
      if (answer == guess) {
        print('║ ➜ $guess is CORRECT ❤, total guesses: $totalGuesses');
        isCorrect = true;
      } else if (answer < guess) {
        print('║ ➜ $guess is TOO HIGH! ▲');
      } else {
        print('║ ➜ $guess is TOO LOW! ▼');
      }
      print('╟───────────────────────────────────────────────');
    }
  } while (!isCorrect);

  print('║                   THE END                     ');
  print('╚═══════════════════════════════════════════════');
}

class Game{
  late int answer; //answer ห้ามเป้น null, late คือกำหนดค่าทีหลังได้
  static const List feedbackList = [
    {
      'text' : 'TOO HIGHT!',
      'isCorrect' : false,
    },
    {
      'text' : 'TOO LOW!',
      'isCorrect' : false,
    },
    {
      'text' : 'CORRECT!',
      'isCorrect' : true,
    }
  ];

  Game(){
    Random r = Random();
    this.answer = Random().nextInt(100) + 1;
    print('ตัวเลขที่สุ่มคือ ${this.answer}');
  }
  Map doGuess(int num){
    if(num > this.answer){
      return feedbackList[0];
    }else if(num < this.answer){
      return feedbackList[1];
    }else{
      return feedbackList[2];
    }
  }
}