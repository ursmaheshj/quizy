import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizbrain = QuizBrain();

void main() => runApp(const Quizy());

class Quizy extends StatelessWidget {
  const Quizy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyApp(),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scores = [];

  void checkAnswer(bool userAns) {
    bool ans = quizbrain.getAns();
    // void resetAll() {
    //   quizbrain.reset();
    //   scores = [];
    // }

    setState(() {
      if (quizbrain.isEnd() == true) {

        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizbrain.reset();

        scores = [];
      }

      else {
        if (ans == userAns) {
          scores.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scores.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizbrain.nextQue();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizbrain.getQue(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        Row(
          children: scores,
        )
      ],
    );
  }
}
