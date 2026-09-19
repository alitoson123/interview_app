import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class JobDescriptionTemplates extends StatelessWidget {
  final String track;
  final ValueChanged<String> onSelectTemplate;

  const JobDescriptionTemplates({
    super.key,
    required this.track,
    required this.onSelectTemplate,
  });

  List<({String title, String content})> _getTemplates(String trackName) {
    final lower = trackName.toLowerCase();
    if (lower.contains('flutter')) {
      return [
        (
          title: 'Senior Flutter',
          content:
              'Senior Flutter Engineer: Building scalable cross-platform mobile apps with Clean Architecture, BLoC state management, custom UI animations, offline caching with Hive/SQLite, and RESTful APIs.',
        ),
        (
          title: 'Flutter & Firebase',
          content:
              'Mobile App Developer: Flutter frontend development integrated with Firebase Auth, Cloud Firestore, Push Notifications, and CI/CD pipelines.',
        ),
      ];
    } else if (lower.contains('backend') || lower.contains('node')) {
      return [
        (
          title: 'Backend API Engineer',
          content:
              'Backend Engineer: Designing scalable REST & GraphQL APIs, microservices architecture, relational (PostgreSQL) and NoSQL databases, Redis caching, and Docker deployments.',
        ),
        (
          title: 'Cloud & System Lead',
          content:
              'Senior Backend Lead: High-throughput distributed systems, event-driven architectures (Kafka/RabbitMQ), AWS cloud services, and security best practices.',
        ),
      ];
    } else if (lower.contains('frontend') || lower.contains('react')) {
      return [
        (
          title: 'Senior Frontend',
          content:
              'Senior Frontend Developer: Building modern responsive web apps with React/Next.js, TypeScript, state management (Zustand/Redux), performance optimization, and accessibility.',
        ),
        (
          title: 'UI/UX Frontend Dev',
          content:
              'Frontend UI Engineer: Pixel-perfect component libraries, design systems integration, micro-frontends, and client-side testing with Jest/Playwright.',
        ),
      ];
    }

    return [
      (
        title: '$track Specialist',
        content:
            '$track Engineer: Practical domain expertise in $track, system design principles, writing maintainable code, problem solving, and technical leadership.',
      ),
      (
        title: 'Full Stack $track',
        content:
            'Full Stack Developer with focus on $track: End-to-end feature delivery, clean architecture, automated testing, and agile team collaboration.',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final templates = _getTemplates(track);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.lightbulb_outline_rounded,
              size: 16.sp,
              color: isDark ? AppColors.accent : AppColors.primary,
            ),
            SizedBox(width: 6.w),
            Text(
              s.quickTemplates,
              style: AppTextStyles.labelL.copyWith(
                color: isDark
                    ? AppColors.darkForeground
                    : AppColors.neutral800,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: templates.map((template) {
            return ActionChip(
              label: Text(
                template.title,
                style: AppTextStyles.caption.copyWith(
                  color: isDark
                      ? AppColors.darkForeground
                      : AppColors.neutral800,
                  fontWeight: FontWeight.w500,
                ),
              ),
              avatar: Icon(
                Icons.add_rounded,
                size: 16.sp,
                color: isDark ? AppColors.primaryGlow : AppColors.primary,
              ),
              backgroundColor: isDark ? AppColors.darkCard : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide(
                  color: isDark ? AppColors.darkBorder : AppColors.neutral200,
                ),
              ),
              onPressed: () => onSelectTemplate(template.content),
            );
          }).toList(),
        ),
      ],
    );
  }
}
