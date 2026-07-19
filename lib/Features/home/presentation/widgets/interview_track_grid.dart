import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';
import 'interview_track_card.dart';

class InterviewTrackGrid extends StatelessWidget {
  const InterviewTrackGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    
    // Using simple maps for track data representation since we don't have a model yet.
    final List<Map<String, dynamic>> tracks = [
      {
        'title': s.track_flutter,
        'subtitle': s.desc_flutter,
        'icon': Icons.smartphone,
        'color': const Color(0xFF4F7CFF), // Primary blue
      },
      {
        'title': s.track_backend,
        'subtitle': s.desc_backend,
        'icon': Icons.dns_outlined,
        'color': const Color(0xFF22B57A), // Success green
      },
      {
        'title': s.track_frontend,
        'subtitle': s.desc_frontend,
        'icon': Icons.code,
        'color': const Color(0xFF9C27B0), // Purple
      },
      {
        'title': s.track_react,
        'subtitle': s.desc_react,
        'icon': Icons.data_object,
        'color': const Color(0xFF03A9F4), // Light blue
      },
      {
        'title': s.track_nodejs,
        'subtitle': s.desc_nodejs,
        'icon': Icons.hub_outlined,
        'color': const Color(0xFF4CAF50), // Green
      },
      {
        'title': s.track_system_design,
        'subtitle': s.desc_system_design,
        'icon': Icons.schema_outlined,
        'color': const Color(0xFFFF9800), // Orange
      },
      {
        'title': s.track_algorithms,
        'subtitle': s.desc_algorithms,
        'icon': Icons.memory,
        'color': const Color(0xFFE5484D), // Destructive red
      },
      {
        'title': s.track_hr,
        'subtitle': s.desc_hr,
        'icon': Icons.favorite_border,
        'color': const Color(0xFFE91E63), // Pink
      },
      {
        'title': s.track_oop,
        'subtitle': s.desc_oop,
        'icon': Icons.layers_outlined,
        'color': const Color(0xFF673AB7), // Deep purple
      },
      {
        'title': s.track_solid,
        'subtitle': s.desc_solid,
        'icon': Icons.psychology_outlined,
        'color': const Color(0xFF00BCD4), // Cyan
      },
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s.choose_interview_track,
              style: AppTextStyles.titleM.copyWith(color: AppColors.neutral900),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                s.see_all,
                style: AppTextStyles.labelL.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tracks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.w,
            childAspectRatio: 2.2, // Adjust based on visual needs
          ),
          itemBuilder: (context, index) {
            final track = tracks[index];
            final color = track['color'] as Color;
            return InterviewTrackCard(
              icon: track['icon'],
              iconBackgroundColor: color.withOpacity(0.1),
              iconColor: color,
              title: track['title'],
              subtitle: track['subtitle'],
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
