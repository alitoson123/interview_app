import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/Core/constant/app_text_style.dart';
import 'package:interview_app/Core/cubits/app_config_cubit/app_config_cubit.dart';
import 'package:interview_app/Core/cubits/app_config_cubit/app_config_state.dart';
import 'package:interview_app/Features/settings/presentation/widgets/language_selector_dialog.dart';
import 'package:interview_app/Features/settings/presentation/widgets/settings_section_card.dart';
import 'package:interview_app/Features/settings/presentation/widgets/settings_tile.dart';
import 'package:interview_app/Features/settings/presentation/widgets/theme_selector_dialog.dart';
import 'package:interview_app/generated/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  String _getThemeLabel(S s, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return s.themeLight;
      case ThemeMode.dark:
        return s.themeDark;
      case ThemeMode.system:
        return s.themeSystem;
    }
  }

  String _getLanguageLabel(S s, Locale locale) {
    return locale.languageCode == 'ar' ? s.arabic : s.english;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocBuilder<AppConfigCubit, AppConfigState>(
      builder: (context, configState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              s.settingsTitle,
              style: AppTextStyles.titleL.copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SettingsSectionCard(
                title: s.preferencesSection,
                children: [
                  SettingsTile(
                    icon: Icons.palette_outlined,
                    title: s.appearance,
                    value: _getThemeLabel(s, configState.themeMode),
                    onTap: () => ThemeSelectorDialog.show(
                      context,
                      currentThemeMode: configState.themeMode,
                      onSelected: (mode) {
                        context.read<AppConfigCubit>().changeThemeMode(mode);
                      },
                    ),
                  ),
                  SettingsTile(
                    icon: Icons.language_outlined,
                    title: s.language,
                    value: _getLanguageLabel(s, configState.locale),
                    onTap: () => LanguageSelectorDialog.show(
                      context,
                      currentLocale: configState.locale,
                      onSelected: (locale) {
                        context.read<AppConfigCubit>().changeLocale(locale);
                      },
                    ),
                  ),
                ],
              ),
              SettingsSectionCard(
                title: s.interviewExperienceSection,
                children: [
                  SettingsTile(
                    icon: Icons.record_voice_over_outlined,
                    title: s.aiVoice,
                    value: s.voiceAlex,
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.mic_none_outlined,
                    title: s.speechSensitivity,
                    value: 'Default',
                    onTap: () {},
                  ),
                ],
              ),
              SettingsSectionCard(
                title: s.supportSection,
                children: [
                  SettingsTile(
                    icon: Icons.help_outline,
                    title: s.helpCenter,
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.shield_outlined,
                    title: s.privacyPolicy,
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.info_outline,
                    title: s.appVersion,
                    value: 'v1.0.0',
                    trailing: const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
