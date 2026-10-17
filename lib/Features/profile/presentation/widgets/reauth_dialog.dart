import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/generated/l10n.dart';

class ReauthDialog extends StatefulWidget {
  final List<String> providers;
  final ValueChanged<String> onPasswordConfirmed;
  final VoidCallback onGoogleConfirmed, onAppleConfirmed, onLoginAgain;

  const ReauthDialog({
    super.key,
    required this.providers,
    required this.onPasswordConfirmed,
    required this.onGoogleConfirmed,
    required this.onAppleConfirmed,
    required this.onLoginAgain,
  });

  static Future<void> show(
    BuildContext context, {
    required List<String> providers,
    required ValueChanged<String> onPasswordConfirmed,
    required VoidCallback onGoogleConfirmed,
    required VoidCallback onAppleConfirmed,
    required VoidCallback onLoginAgain,
  }) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => ReauthDialog(
      providers: providers,
      onPasswordConfirmed: onPasswordConfirmed,
      onGoogleConfirmed: onGoogleConfirmed,
      onAppleConfirmed: onAppleConfirmed,
      onLoginAgain: onLoginAgain,
    ),
  );

  @override
  State<ReauthDialog> createState() => _ReauthDialogState();
}

class _ReauthDialogState extends State<ReauthDialog> {
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  String _prompt(S s) {
    if (widget.providers.contains('google.com')) return s.reauthGooglePrompt;
    if (widget.providers.contains('apple.com')) return s.reauthApplePrompt;
    if (widget.providers.contains('password')) return s.reauthPasswordPrompt;
    return s.recentLoginRequired;
  }

  Widget _buildAction(S s) {
    final nav = Navigator.of(context);
    if (widget.providers.contains('google.com')) {
      return ElevatedButton.icon(
        icon: const Icon(Icons.g_mobiledata, size: 22),
        label: Text(s.reauthGoogleButton),
        onPressed: () { nav.pop(); widget.onGoogleConfirmed(); },
      );
    }
    if (widget.providers.contains('apple.com')) {
      return ElevatedButton(
        onPressed: () { nav.pop(); widget.onAppleConfirmed(); },
        child: Text(s.reauthAppleButton),
      );
    }
    if (widget.providers.contains('password')) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.destructive,
          foregroundColor: AppColors.white,
        ),
        onPressed: () {
          final pwd = _passwordController.text.trim();
          if (pwd.isNotEmpty) { nav.pop(); widget.onPasswordConfirmed(pwd); }
        },
        child: Text(s.reauthConfirm),
      );
    }
    return ElevatedButton(
      onPressed: () { nav.pop(); widget.onLoginAgain(); },
      child: Text(s.loginAgain),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPassword = widget.providers.contains('password');

    return AlertDialog(
      backgroundColor: isDark ? AppColors.darkCard : AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: Row(
        children: [
          Icon(Icons.lock_clock_outlined, color: AppColors.primary, size: 24.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              s.reauthRequiredTitle,
              style: AppTextStyles.titleL.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(_prompt(s), style: AppTextStyles.bodyM.copyWith(color: AppColors.neutral500)),
          if (isPassword) ...[
            SizedBox(height: 16.h),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: s.password,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
          ],
        ],
      ),
      actionsPadding: EdgeInsets.only(right: 16.w, bottom: 16.h, left: 16.w),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(s.cancel, style: AppTextStyles.labelL.copyWith(color: AppColors.neutral500)),
        ),
        _buildAction(s),
      ],
    );
  }
}
