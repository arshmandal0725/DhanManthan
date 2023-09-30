class QuizQuestions {
  const QuizQuestions(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> shuffele() {
    final shuffeled = List.of(answers);
    shuffeled.shuffle();
    return shuffeled;
  }
}
