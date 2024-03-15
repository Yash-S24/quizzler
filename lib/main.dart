import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
Quiz_brain quiz_brain=Quiz_brain();
void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> Scorekeeper = [];
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer=quiz_brain.getCorrectAnswer();
    setState(() {
      if(quiz_brain.isFinished()==true){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quiz_brain.reset;
      }
      if(userPickedAnswer==correctAnswer){
        Scorekeeper.add(Icon(Icons.check, color: Colors.lightGreen,));
      }
      else{
        Scorekeeper.add(Icon(Icons.close, color: Colors.red));
      }
    });
      quiz_brain.nextQuestion();
  }
  // List<String> questions = [
  //       'Yash is a good boy'
  //       'Rainbow has 9 colors'
  //       'MS Dhoni is not a credit stealer'
  // ];
  // List<bool> Answers=[
  //   true,
  //   false,
  //   false,
  // ];
  // Question q1= Question(q: 'Yash is a good boy', a: true);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz_brain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                checkAnswer(true);
                },
              ),
            )),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                // style: ButtonStyle(
                //   backgroundColor: MaterialStateProperty.all(Colors.red),
                //   foregroundColor: MaterialStateProperty.all(Colors.white)
                // ),
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            )),
        //TODO:Add 3 rows as score keeper
        Row(
          children: Scorekeeper,
        ),
      ],
    );
  }
}



