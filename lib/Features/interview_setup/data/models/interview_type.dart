import 'package:flutter/material.dart';
import 'package:interview_app/generated/l10n.dart';

enum InterviewType {
  technical,
  hr,
  mixed,
  rapidFire;

  String getTitle(S s) {
    switch (this) {
      case InterviewType.technical:
        return s.interviewTypeTechnical;
      case InterviewType.hr:
        return s.interviewTypeHR;
      case InterviewType.mixed:
        return s.interviewTypeMixed;
      case InterviewType.rapidFire:
        return s.interviewTypeRapidFire;
    }
  }

  String getSubtitle(S s) {
    switch (this) {
      case InterviewType.technical:
        return s.interviewTypeTechnicalSub;
      case InterviewType.hr:
        return s.interviewTypeHRSub;
      case InterviewType.mixed:
        return s.interviewTypeMixedSub;
      case InterviewType.rapidFire:
        return s.interviewTypeRapidFireSub;
    }
  }

  IconData get icon {
    switch (this) {
      case InterviewType.technical:
        return Icons.code;
      case InterviewType.hr:
        return Icons.people;
      case InterviewType.mixed:
        return Icons.sync_alt;
      case InterviewType.rapidFire:
        return Icons.flash_on;
    }
  }

  Color get color {
    switch (this) {
      case InterviewType.technical:
        return const Color(0xff4F6CFF); // Blue
      case InterviewType.hr:
        return const Color(0xffFF6B93); // Pinkish
      case InterviewType.mixed:
        return const Color(0xff2ED199); // Green
      case InterviewType.rapidFire:
        return const Color(0xffFFB84C); // Yellow/Orange
    }
  }
}
