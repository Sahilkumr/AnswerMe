import 'package:answerme/data/quiz_question_answers.dart';
import 'package:answerme/result_screen_widget.dart';
import 'package:answerme/widget_homescreen.dart';
import 'package:answerme/widget_quiz_questions_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activescreen;
  List<String> selectedanswers = [];

  void getAnswer(String answer) {
    selectedanswers.add(answer);
    //is the all answers are answered.
    if (selectedanswers.length == questions.length) {
      setState(() {
        activescreen = ResultScreen(
          userattemptedanswers: selectedanswers,onRestart: restartQuiz,onHome: goHomescreen,
        );
        // selectedanswers.length = 0;
      });
    }
  }

  @override
  void initState() {
    activescreen = HomeScreen(changeScreen);
    super.initState();
  }

  void goHomescreen(){
    setState(() {
      selectedanswers = [];
      activescreen =  HomeScreen(changeScreen);
    });
  }
  void restartQuiz(){
    setState(() {
      selectedanswers = [];
    activescreen = QuizQuestions(onAnswerSelected: getAnswer);
    });
  }
  void changeScreen() {
    setState(() {
      activescreen = QuizQuestions(
        onAnswerSelected: getAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: activescreen,
        backgroundColor: const Color.fromARGB(255, 165, 15, 165),
      ),
    );
  }
}
