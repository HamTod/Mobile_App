import 'dart:math';

class Game {
  final int _answer;
  int _totalGuesses = 0;
  List<String> answerList = [];
  var numlist;

  Game() : _answer = Random().nextInt(100) + 1 {
    print('The answer is: $_answer');
  }
  int get totalGuesses {
    return _totalGuesses;
  }

  String toString() {
    String numList = '';
    for (var item =0; item<answerList.length; item++) {
      if(answerList.length-1==item){
        numList += answerList[item];
      }else{
        numList += answerList[item]+"=>";
      }

    }
    return numList;
  }

  int doGuess(int num) {
    _totalGuesses++;
    answerList.add(num.toString());
    if (num > _answer) {
      return 1;
    } else if (num < _answer) {
      return -1;
    } else {
      return 0;
    }
  }
}