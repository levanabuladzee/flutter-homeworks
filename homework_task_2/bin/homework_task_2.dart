import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print('Type exit to quit the game');
  diceGame();
}

void diceGame() {
  final random = Random();
  var userScore = 0;
  var computerScore = 0;

  while (true) {
    stdout.write('\nDo you want to roll the dice? (y/exit) ');
    var choice = stdin.readLineSync();

    if (choice.toLowerCase() == 'exit') {
      if (userScore > computerScore) {
        print('You won. your score - $userScore, computer\'s score - $computerScore');
      } else if (userScore < computerScore) {
        print('Computer won. your score - $userScore, computer\'s score - $computerScore');
      } else {
        print('Draw. your score - $userScore, computer\'s score - $computerScore');
      }
      break;
    } else if (choice.toLowerCase() == 'y') {
      var userDice1 = random.nextInt(6) + 1;
      var userDice2 = random.nextInt(6) + 1;
      var computerDice1 = random.nextInt(6) + 1;
      var computerDice2 = random.nextInt(6) + 1;
      var userSum = userDice1 + userDice2;
      var computerSum = computerDice1 + computerDice2;

      print('\nYou rolled dices, first dice - $userDice1, second dice - $userDice2');
      print('Computer rolled dices, first dice - $computerDice1, second dice - $computerDice2');
      print('sum of your dices - $userSum, sum of computer\'s dices - $computerSum');

      if (userSum > computerSum) {
        print('\nCongrats you\'ve scored');
        userScore++;
      } else {
        print('\nComputer has scored');
        computerScore++;
      }
    } else {
      continue;
    }
  }
}
