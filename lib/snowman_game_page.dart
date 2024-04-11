import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SnowmanGamePage(),
  ));
}

class SnowmanGamePage extends StatefulWidget {
  @override
  _SnowmanGamePageState createState() => _SnowmanGamePageState();
}

class _SnowmanGamePageState extends State<SnowmanGamePage> {
  List<String> _words = [
    "FLUTTER", "DART", "ANDROID", "JAVA", "SWIFT",
    "PYTHON", "REACT", "HTML", "CSS", "JAVASCRIPT"
  ]; // List of words to be guessed
  List<String> _hints = [
    "Mobile app development framework",
    "Programming language",
    "Mobile operating system",
    "Programming language",
    "Programming language",
    "Programming language",
    "JavaScript library",
    "Markup language",
    "Style sheet language",
    "Programming language"
  ]; // Hints corresponding to the words
  int _currentWordIndex = 0; // Index of the current word
  List<String> _guessedLetters = []; // Letters guessed by the player
  int _mistakes = 0; // Number of incorrect guesses
  int _score = 0; // Score count

  // Function to check if the letter is in the word
  bool _isLetterInWord(String letter) {
    return _words[_currentWordIndex].contains(letter);
  }

  // Function to handle a letter guess
  void _handleGuess(String letter) {
    setState(() {
      if (!_guessedLetters.contains(letter)) {
        _guessedLetters.add(letter);
        if (!_isLetterInWord(letter)) {
          _mistakes++;
          if (_mistakes >= 7) {
            _resetGame();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sorry, you lost!'),
              ),
            );
          }
        }
        if (_isWordGuessed()) {
          _score += 5; // Increment score by 5 for a correct guess
          _nextWord();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Congratulations, you guessed the word!'),
            ),
          );
        }
      }
    });
  }

  // Function to reset the game
  void _resetGame() {
    setState(() {
      _guessedLetters.clear();
      _mistakes = 0;
      _score = 0; // Reset score
    });
  }

  // Function to check if the current word is guessed
  bool _isWordGuessed() {
    String word = _words[_currentWordIndex];
    return word.split('').every((letter) => _guessedLetters.contains(letter));
  }

  // Function to move to the next word
  void _nextWord() {
    setState(() {
      _currentWordIndex = (_currentWordIndex + 1) % _words.length;
      _guessedLetters.clear();
      _mistakes = 0;
    });
  }

  // Function to build the word display
  Widget _buildWordDisplay() {
    String word = _words[_currentWordIndex];
    String hint = _hints[_currentWordIndex];
    return Column(
      children: [
        Text(
          'Hint: $hint',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: word.split('').map((letter) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                _guessedLetters.contains(letter) ? letter : '_',
                style: TextStyle(fontSize: 24.0),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Function to build the snowman display
  Widget _buildSnowmanDisplay() {
    int maxMistakes = 7;
    int remainingMistakes = maxMistakes - _mistakes;
    int snowmanIndex = maxMistakes - remainingMistakes;
    String snowmanImage = 'assets/snowman$snowmanIndex.png';

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Container(
            width: 200, // Adjust the width for the size of the snowman image
            height: 200, // Adjust the height for the size of the snowman image
            child: _mistakes > 0 && remainingMistakes > 0
                ? Image.asset(snowmanImage)
                : SizedBox(),
          ),
          Text(
            'Mistakes left: $remainingMistakes',
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            'Score: $_score', // Display the score
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  // Function to build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snowman Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildSnowmanDisplay(),
            SizedBox(height: 20),
            _buildWordDisplay(),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Alphabet buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (var letter = 'A'.codeUnitAt(0); letter <= 'I'.codeUnitAt(0); letter++)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green), // Change the button background color to green
                            ),
                            onPressed: () {
                              _handleGuess(String.fromCharCode(letter));
                            },
                            child: Text(
                              String.fromCharCode(letter),
                              style: TextStyle(
                                color: Colors.white, // Change the text color to white
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (var letter = 'J'.codeUnitAt(0); letter <= 'R'.codeUnitAt(0); letter++)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green), // Change the button background color to green
                            ),
                            onPressed: () {
                              _handleGuess(String.fromCharCode(letter));
                            },
                            child: Text(
                              String.fromCharCode(letter),
                              style: TextStyle(
                                color: Colors.white, // Change the text color to white
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (var letter = 'S'.codeUnitAt(0); letter <= 'Z'.codeUnitAt(0); letter++)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green), // Change the button background color to green
                            ),
                            onPressed: () {
                              _handleGuess(String.fromCharCode(letter));
                            },
                            child: Text(
                              String.fromCharCode(letter),
                              style: TextStyle(
                                color: Colors.white, // Change the text color to white
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
