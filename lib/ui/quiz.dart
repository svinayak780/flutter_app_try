import 'package:flutter/material.dart';

class Question {
  String questionText;
  bool isTrue;
  Question.name(this.questionText, this.isTrue);
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  List questionBank = [
    Question.name("T", true),
    Question.name("TT", true),
    Question.name("F", false),
    Question.name("FF", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("True Citizen"),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white10,
        body: Builder(
          builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Image.asset(
                  "images/us_flag.png",
                  height: 200,
                  width: 200,
                )),
                Container(
                    width: 390,
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white30),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "${questionBank[_questionIndex].questionText}",
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => _checkAnswer(true, context),
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Text(
                            "  True",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(false, context),
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          Text(
                            "  False",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          Text(
                            "  Next",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  _checkAnswer(bool choice, BuildContext context) {
    if (choice == questionBank[_questionIndex].isTrue) {
      final snackBar = SnackBar(
        content: Text("Correct"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: Text("Wrong"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
    _nextQuestion();
  }

  _nextQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % questionBank.length;
    });
  }
}
