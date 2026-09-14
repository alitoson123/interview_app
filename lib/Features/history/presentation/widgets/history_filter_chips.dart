import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/history/presentation/view_model/history_cubit/history_state.dart';
import 'package:interview_app/generated/l10n.dart';

class HistoryFilterChips extends StatelessWidget {
  final HistoryFilter selectedFilter;
  final ValueChanged<HistoryFilter> onFilterSelected;

  const HistoryFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final filters = [
      (HistoryFilter.all, s.filterAll),
      (HistoryFilter.inProgress, s.filterInProgress),
      (HistoryFilter.completed, s.filterCompleted),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((item) {
          final isSelected = selectedFilter == item.$1;
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: ChoiceChip(
              label: Text(
                item.$2,
                style: AppTextStyles.bodyM.copyWith(
                  color: isSelected ? Colors.white : AppColors.neutral700,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
              selected: isSelected,
              selectedColor: AppColors.primary,
              backgroundColor: AppColors.neutral100,
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide(
                  color: isSelected ? AppColors.primary : AppColors.neutral300,
                  width: 1,
                ),
              ),
              onSelected: (_) => onFilterSelected(item.$1),
            ),
          );
        }).toList(),
      ),
    );
  }
}
