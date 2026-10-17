import 'package:interview_app/Core/constant/app_constant.dart';
import 'package:interview_app/Core/services/Local_service/general_local_service.dart';

class AiConsentService {
  final GeneralLocalService generalLocalService;

  AiConsentService({required this.generalLocalService});

  Future<bool> hasAcceptedConsent() async {
    final accepted = await generalLocalService.get<bool>(
      AppConstant.settingsBox,
      AppConstant.hasAcceptedAiConsentKey,
    );
    return accepted ?? false;
  }

  Future<void> setConsent(bool accepted) async {
    await generalLocalService.put<bool>(
      AppConstant.settingsBox,
      AppConstant.hasAcceptedAiConsentKey,
      accepted,
    );
  }

  Future<void> revokeConsent() async {
    await generalLocalService.delete<bool>(
      AppConstant.settingsBox,
      AppConstant.hasAcceptedAiConsentKey,
    );
  }
}
