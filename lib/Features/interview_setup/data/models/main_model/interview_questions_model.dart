class InterviewQuestionsModel {
  final String id;
  final String modelQuestion;
  final String modelAnswer;
  final String? userAnswer;

  const InterviewQuestionsModel({
    required this.modelQuestion,
    required this.modelAnswer,
    required this.id,
    this.userAnswer,
  });

  InterviewQuestionsModel copyWith({
    String? id,
    String? modelQuestion,
    String? modelAnswer,
    String? userAnswer,
  }) {
    return InterviewQuestionsModel(
      id: id ?? this.id,
      modelQuestion: modelQuestion ?? this.modelQuestion,
      modelAnswer: modelAnswer ?? this.modelAnswer,
      userAnswer: userAnswer ?? this.userAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'questionText': modelQuestion,
      'answerText': modelAnswer,
      'userAnswer': userAnswer,
    };
  }

  factory InterviewQuestionsModel.fromMap(Map<String, dynamic> map) {
    return InterviewQuestionsModel(
      id: map['id'] ?? '',
      modelQuestion: map['questionText'] ?? '',
      modelAnswer: map['answerText'] ?? '',
      userAnswer: map['userAnswer'],
    );
  }
}
