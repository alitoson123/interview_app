class InterviewQuota {
  final int used;
  final int limit;

  const InterviewQuota({
    required this.used,
    this.limit = 3,
  });

  int get remaining => (limit - used).clamp(0, limit);
  bool get isLimitReached => used >= limit;

  static const initial = InterviewQuota(used: 0, limit: 3);
}
