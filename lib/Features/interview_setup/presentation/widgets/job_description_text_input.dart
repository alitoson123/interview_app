import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class JobDescriptionTextInput extends StatelessWidget {
  final TextEditingController controller;
  final int maxChars;
  final VoidCallback onChanged;

  const JobDescriptionTextInput({
    super.key,
    required this.controller,
    required this.maxChars,
    required this.onChanged,
  });

  Future<void> _pasteFromClipboard(BuildContext context) async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data?.text != null && data!.text!.isNotEmpty) {
      controller.text = data.text!;
      onChanged();
    }
  }

  void _clearText() {
    controller.clear();
    onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final charCount = value.text.length;
        final hasText = value.text.isNotEmpty;
        final isParsed = charCount > 40;

        return Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCard : Colors.white,
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.neutral200,
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header actions: Paste from clipboard & Clear
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => _pasteFromClipboard(context),
                      borderRadius: BorderRadius.circular(8.r),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 4.h,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.paste_rounded,
                              size: 15.sp,
                              color: isDark
                                  ? AppColors.primaryGlow
                                  : AppColors.primary,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              s.pasteFromClipboard,
                              style: AppTextStyles.caption.copyWith(
                                color: isDark
                                    ? AppColors.primaryGlow
                                    : AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (hasText)
                      InkWell(
                        onTap: _clearText,
                        borderRadius: BorderRadius.circular(8.r),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 4.h,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.clear_rounded,
                                size: 14.sp,
                                color: isDark
                                    ? AppColors.darkMutedForeground
                                    : AppColors.neutral500,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                s.clearText,
                                style: AppTextStyles.caption.copyWith(
                                  color: isDark
                                      ? AppColors.darkMutedForeground
                                      : AppColors.neutral500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Divider(
                color: isDark ? AppColors.darkBorder : AppColors.neutral100,
                height: 1,
              ),
              // Text input field
              TextField(
                controller: controller,
                maxLength: maxChars,
                maxLines: 7,
                style: AppTextStyles.bodyM.copyWith(
                  color: isDark
                      ? AppColors.darkForeground
                      : AppColors.neutral800,
                ),
                decoration: InputDecoration(
                  hintText: s.pasteJobDescriptionHint,
                  hintStyle: AppTextStyles.bodyM.copyWith(
                    color: isDark
                        ? AppColors.darkMutedForeground
                        : AppColors.neutral400,
                  ),
                  contentPadding: EdgeInsets.all(16.w),
                  border: InputBorder.none,
                  counterText: '',
                ),
                onChanged: (_) => onChanged(),
              ),
              Divider(
                color: isDark ? AppColors.darkBorder : AppColors.neutral100,
                height: 1,
              ),
              // Bottom status bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$charCount / $maxChars ${s.chars}',
                      style: AppTextStyles.caption.copyWith(
                        color: isDark
                            ? AppColors.darkMutedForeground
                            : AppColors.neutral400,
                      ),
                    ),
                    if (isParsed)
                      Row(
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            size: 12.sp,
                            color: isDark
                                ? AppColors.primaryGlow
                                : AppColors.primary,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            s.aiParsed,
                            style: AppTextStyles.caption.copyWith(
                              color: isDark
                                  ? AppColors.primaryGlow
                                  : AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
