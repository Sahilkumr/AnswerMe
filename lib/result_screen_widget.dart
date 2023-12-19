import 'package:answerme/data/quiz_question_answers.dart';
import 'package:answerme/quiz_result_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.onHome,
      required this.userattemptedanswers,
      required this.onRestart});

  final List<String> userattemptedanswers;
  final void Function() onRestart;
  final void Function() onHome;

  List<Map<String, Object>> quizResultData() {
    final List<Map<String, Object>> result = [];

    for (int i = 0; i < userattemptedanswers.length; i++) {
      result.add({
        'QuestionNo': i,
        'Question': questions[i].question,
        'QuestionsCorrectAnswer': questions[i].answers[0],
        'UserAttemptedAnswer': userattemptedanswers[i]
      });
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final quizresultdata = quizResultData();
    final totalquizquestions = questions.length;
    final totalcorrectquestions = quizresultdata.where((quizdata) {
      return quizdata['QuestionsCorrectAnswer'] ==
          quizdata['UserAttemptedAnswer'];
    });

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Answered ${totalcorrectquestions.length} Correct Out of $totalquizquestions  Questions!',
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuizResultData(resultdata: quizresultdata),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: onRestart,
                  icon: const Icon(
                    Icons.refresh_outlined,
                    size: 28,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Restart Quiz',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.home_filled),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: onHome,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
