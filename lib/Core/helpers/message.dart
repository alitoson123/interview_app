import 'package:flutter/material.dart';
import 'package:interview_app/Core/widgets/app_dialog.dart';
import 'package:interview_app/generated/l10n.dart';

class Message {
  static void MessageErrorMethod(BuildContext context, {required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        );
      },
    );
  }

  /// Shows an email-not-verified dialog with a "Send Again" action
  /// and a "Got it" dismiss button.
  static void showEmailNotVerifiedDialog(
    BuildContext context, {
    required String message,
    required VoidCallback onSendAgain,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        final s = S.of(dialogContext);
        return AlertDialog(
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onSendAgain();
              },
              child: Text(s.send_again),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(s.ok),
            ),
          ],
        );
      },
    );
  }

 static void showAppDialog({
    required BuildContext context,
    required DialogType type,
    required String message,
    String? title,
    String? buttonText,
    bool isVerifyButton = false,
  }) {
    showDialog(
      context: context,
      builder: (_) => AppDialog(
        type: type,
        message: message,
        title: title,
        buttonText: buttonText,
        isVerifyButton: isVerifyButton ,
      ),
    );
  }

static  void MessageSuccessMethod(
    BuildContext context, {
    required String message,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: duration ?? Duration(seconds: 1),
      ),
    );
  }
}
