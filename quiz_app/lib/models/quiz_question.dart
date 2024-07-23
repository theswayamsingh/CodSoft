class QuizQuestion {
  
  final String text;
  final List<String> answers;
  
  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // .of() creates copy of list.
    shuffledList.shuffle(); // .shuffle() modifies the original list.
    return shuffledList;
  }
}
