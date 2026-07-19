import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_app/Core/navigator/navigator.dart';
import 'package:interview_app/Features/interview_setup/data/models/interview_model.dart';
import 'package:interview_app/Features/interview_setup/data/models/technology_model.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/interview_custom_app_bar.dart';
import 'package:interview_app/Features/interview_setup/presentation/widgets/selection_card.dart';

class TechnologySelectionScreen extends StatefulWidget {
  final InterviewModel track;

  const TechnologySelectionScreen({super.key, required this.track});

  @override
  State<TechnologySelectionScreen> createState() =>
      _TechnologySelectionScreenState();
}

class _TechnologySelectionScreenState extends State<TechnologySelectionScreen> {
  TechnologyModel? _selectedTechnology;

  void _onTechnologySelected(TechnologyModel technology) {
    setState(() => _selectedTechnology = technology);
    context.push(
      AppRoutes.experienceLevelScreen,
      extra: {'stepLabel': 'Step 3 of 5', 'currentStep': 3},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FAFD),

      body: SafeArea(
        child: Column(
          children: [
            InterviewCustomAppBar(
              title: widget.track.title,
              subTitle: 'Choose your preferred technology.',
              currentStep: 2,
              stepLabel: 'Step 2 of 5',
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 1.65,
                ),
                itemCount: widget.track.technologies.length,
                itemBuilder: (context, index) {
                  final technology = widget.track.technologies[index];
                  return SelectionCard(
                    title: technology.title,
                    icon: technology.icon,
                    iconColor: technology.color,
                    isSelected: _selectedTechnology == technology,
                    onTap: () => _onTechnologySelected(technology),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
