class QuizQuestionBank {
  const QuizQuestionBank(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledanswers = List<String>.of(answers);
    shuffledanswers.shuffle();
    return shuffledanswers;
  }
}
