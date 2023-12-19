import 'package:flutter/material.dart';

class QuizResultData extends StatelessWidget {
  const QuizResultData({super.key, required this.resultdata});
  final List<Map<String, Object>> resultdata;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // color: Colors.white,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 233, 181, 241),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: resultdata.map((result) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Printing Question No in Result
                Text(
                  ((result['QuestionNo'] as int) + 1).toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (result['Question'] as String),
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          (result['QuestionsCorrectAnswer'] as String),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          (result['UserAttemptedAnswer'] as String),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
