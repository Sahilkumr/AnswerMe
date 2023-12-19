import 'package:answerme/widget_answer_button.dart';
import 'package:flutter/material.dart';
import 'package:answerme/data/quiz_question_answers.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestions extends StatefulWidget {
  const QuizQuestions({required this.onAnswerSelected, super.key});

  final void Function(String answer) onAnswerSelected;

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  int nextQuestion = 0;
  void getNextQuestion(String answer) {
    widget.onAnswerSelected(answer);
    setState(() {
      nextQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[nextQuestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(2),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.question,
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 248, 194, 247),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  ...currentQuestion.getShuffledAnswers().map((answer) {
                    return AnswerButton(answer, () {
                      getNextQuestion(answer);
                    });
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
