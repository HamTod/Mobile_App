import 'dart:io';
import 'dart:math';

void main() {

  const MAX_RANDOM = 100;

  Random r = new Random();
  int answer = r.nextInt(MAX_RANDOM) + 1;
  int count = 0;

  var guess;

  print('╔═════════════════════════════════════════════╗');
  print('║            ☺ GUESS THE NUMBER ☻            ║ ');
  print('╟─────────────────────────────────────────────╢');

  do {

    stdout.write('║  Guess the number between 1 and $MAX_RANDOM: ');
    String? input = stdin.readLineSync();
    if (input == null) return;

    if (int.tryParse(input) == null) {

      while (int.tryParse(input) != null) {
        stdout.write('║  Guess the number between 1 and $MAX_RANDOM:        ║');
        String? input = stdin.readLineSync();
        if (input == null) return;
      }

    } else {

      guess = int.tryParse(input)!;
      count++;

      if (guess == answer) {
        print('║  ➜ $guess is CORRECT! ❤,  Total guesses: $count 〠');
        print('╟─────────────────────────────────────────────╢');
      } else if (answer < guess) { //น้อยกว่าคำตอบ
        print('║  ➜ $guess is TOO HIGH! ▲ ');
        print('╟─────────────────────────────────────────────╢');
      } else { //มากกกว่าคำตอบ
        print('║  ➜ $guess is TOO LOW! ▼ ');
        print('╟─────────────────────────────────────────────╢');
      }
    }
  } while (guess != answer);

  print('║                 🎉 THE END 🎉          ');
  print('╚═════════════════════════════════════════════╝');
}