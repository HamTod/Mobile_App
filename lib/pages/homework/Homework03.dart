import 'dart:io';
import 'dart:math';

void main(){
  print('╔═══════════════════════════════════════════════');
  print('║               GUESS THE NUMBER                ');
  print('╟───────────────────────────────────────────────');
  var input;
  var maxNum;
  do{
    stdout.write('║ Enter max number you want to guess: ');
    input = stdin.readLineSync();
    maxNum = int.tryParse(input);
    print('╟───────────────────────────────────────────────');
  }while(!(maxNum is int));
  var G = Game(maxRandom: int.tryParse(input)!);
  do{
    stdout.write('║ Guess the number between 1 and ${G.maxRandom}: ');
    input = stdin.readLineSync();
    if(int.tryParse(input!) == null)continue;
    String text = G.doGuess(int.tryParse(input!));
    if(G.isCorrect()) text =text;
    print('║ ➜ $input : $text ');
    print('╟───────────────────────────────────────────────');
  }while(!G.isCorrect());
  print('║  Total guesses: ${G.getTotalGuesses()}');
  print('╟───────────────────────────────────────────────');
  print('║                   THE END                     ');
  print('╚═══════════════════════════════════════════════');
}
class Game{
  var answer;
  var maxRandom;
  var totalGuesses = 0;
  var correct = false;
  Game({ int maxRandom : 100}){
    answer = Random().nextInt(maxRandom) +1;
    this.maxRandom =maxRandom;
  }
  String doGuess(var guess){
    totalGuesses++;
    if(answer < guess){
      return "TOO HIGH! ▲";
    }
    else if(answer > guess){
      return "TOO LOW! ▼";
    }
    correct =true;
    return "CORRECT ❤";
  }
  int getTotalGuesses(){
    return totalGuesses;
  }
  bool isCorrect(){
    return correct;
  }

}