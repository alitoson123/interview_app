class InterviewQuestionsModel {
  final String id;
  final String questionText;
  final String answerText;

  const InterviewQuestionsModel({
    required this.questionText,
    required this.answerText,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {'questionText': questionText, 'answerText': answerText};
  }

  factory InterviewQuestionsModel.fromMap(Map<String, dynamic> map) {
    return InterviewQuestionsModel(
      id: map['id'],
      questionText: map['questionText'],
      answerText: map['answerText'],
    );
  }
}
