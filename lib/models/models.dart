class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}

class Quiz {
  final String code;
  final List<QuizQuestion> questions;

  Quiz({
    required this.code,
    required this.questions,
  });
}

// In-memory storage for quizzes (for demo purposes)
final Map<String, Quiz> quizStorage = {};
