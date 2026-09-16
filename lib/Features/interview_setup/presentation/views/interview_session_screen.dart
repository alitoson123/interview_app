import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/Features/interview_setup/presentation/view_model/interview_session_cubit/interview_session_cubit.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/session/interview_session_body.dart';
import 'package:interview_app/generated/l10n.dart';

class InterviewSessionScreen extends StatelessWidget {
  final InterviewSessionModel session;
  final int initialIndex;

  const InterviewSessionScreen({
    super.key,
    required this.session,
    this.initialIndex = 0,
  });

  Future<void> _handleExit(BuildContext context) async {
    final s = S.of(context);
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(s.exitInterview, style: AppTextStyles.titleM),
        content: Text(s.exitInterviewConfirm, style: AppTextStyles.bodyM),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(s.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              s.exit,
              style: const TextStyle(color: AppColors.destructive),
            ),
          ),
        ],
      ),
    );

    if (shouldExit == true && context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          InterviewSessionCubit(session: session, initialIndex: initialIndex),
      child: Builder(
        builder: (context) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (!didPop) _handleExit(context);
            },
            child: InterviewSessionBody(onExit: () => _handleExit(context)),
          );
        },
      ),
    );
  }
}
