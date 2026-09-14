import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Core/services/locator_service/service_locator.dart';
import 'package:interview_app/Core/theme/app_color.dart';
import 'package:interview_app/Features/history/data/repo_impl/history_repo_impl.dart';
import 'package:interview_app/Features/history/presentation/view_model/history_cubit/history_cubit.dart';
import 'package:interview_app/Features/history/presentation/view_model/history_cubit/history_state.dart';
import 'package:interview_app/Features/history/presentation/widgets/history_empty_state.dart';
import 'package:interview_app/Features/history/presentation/widgets/history_filter_chips.dart';
import 'package:interview_app/Features/history/presentation/widgets/history_item_card.dart';
import 'package:interview_app/Features/interview_setup/data/models/main_model/interview_session.dart';
import 'package:interview_app/generated/l10n.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HistoryCubit(historyRepo: getIt<HistoryRepoImpl>())..fetchHistory(),
      child: const _HistoryViewBody(),
    );
  }
}

class _HistoryViewBody extends StatelessWidget {
  const _HistoryViewBody();

  Future<void> _showDeleteDialog(
    BuildContext context,
    InterviewSession session,
  ) async {
    final s = S.of(context);
    final cubit = context.read<HistoryCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(s.deleteInterview, style: AppTextStyles.titleM),
        content: Text(s.deleteInterviewConfirm, style: AppTextStyles.bodyM),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(s.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              s.delete,
              style: const TextStyle(color: AppColors.destructive),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      cubit.deleteInterview(session.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.neutral50,
      appBar: AppBar(
        title: Text(s.historyTitle, style: AppTextStyles.titleL),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HistoryError) {
            return Center(
              child: Text(state.errorMessage, style: AppTextStyles.bodyM),
            );
          }
          if (state is HistorySuccess) {
            return RefreshIndicator(
              onRefresh: () => context.read<HistoryCubit>().fetchHistory(),
              child: ListView(
                padding: EdgeInsets.all(20.w),
                children: [
                  HistoryFilterChips(
                    selectedFilter: state.currentFilter,
                    onFilterSelected: (filter) =>
                        context.read<HistoryCubit>().changeFilter(filter),
                  ),
                  SizedBox(height: 16.h),
                  if (state.filteredInterviews.isEmpty)
                    SizedBox(height: 400.h, child: const HistoryEmptyState())
                  else
                    /*     ...state.filteredInterviews.map(
                      (item) => HistoryItemCard(
                        session: item,
                        onTap: () async {
                          await context.push(
                            AppRoutes.interviewDetailsScreen,
                            extra: item,
                          );
                          if (context.mounted) {
                            context.read<HistoryCubit>().fetchHistory();
                          }
                        },
                        onDelete: () => _showDeleteDialog(context, item),
                      ),
                    ),
*/
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.filteredInterviews.length,
                      itemBuilder: (context, index) {
                        final item = state.filteredInterviews[index];
                        return HistoryItemCard(
                          session: item,
                          onTap: () async {
                            await context.push(
                              AppRoutes.interviewDetailsScreen,
                              extra: item,
                            );
                            if (context.mounted) {
                              context.read<HistoryCubit>().fetchHistory();
                            }
                          },
                          onDelete: () => _showDeleteDialog(context, item),
                        );
                      },
                    ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
