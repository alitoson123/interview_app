import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class JobDescriptionFileUploadCard extends StatelessWidget {
  final String? uploadedFileName;
  final String? uploadedFileSize;
  final VoidCallback onPickFile;
  final VoidCallback onRemoveFile;

  const JobDescriptionFileUploadCard({
    super.key,
    required this.uploadedFileName,
    this.uploadedFileSize,
    required this.onPickFile,
    required this.onRemoveFile,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasFile = uploadedFileName != null;

    if (hasFile) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.primaryGlow.withValues(alpha: 0.12)
              : AppColors.primary.withValues(alpha: 0.06),
          border: Border.all(
            color: isDark ? AppColors.primaryGlow : AppColors.primary,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.picture_as_pdf_rounded,
                color: isDark ? AppColors.primaryGlow : AppColors.primary,
                size: 22.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    uploadedFileName!,
                    style: AppTextStyles.labelL.copyWith(
                      color: isDark
                          ? AppColors.darkForeground
                          : AppColors.neutral900,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    uploadedFileSize ?? s.fileReady,
                    style: AppTextStyles.caption.copyWith(
                      color: isDark
                          ? AppColors.primaryGlow
                          : AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.close_rounded,
                color: isDark ? AppColors.destructive : AppColors.destructive,
                size: 20.sp,
              ),
              tooltip: s.removeFile,
              onPressed: onRemoveFile,
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: onPickFile,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.neutral300,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.upload_file_rounded,
              color: isDark
                  ? AppColors.darkMutedForeground
                  : AppColors.neutral600,
              size: 22.sp,
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                s.uploadPdfResumeJD,
                style: AppTextStyles.labelL.copyWith(
                  color: isDark
                      ? AppColors.darkForeground
                      : AppColors.neutral700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
