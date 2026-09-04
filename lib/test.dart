import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

class TestGenerateInterviewScreen extends StatefulWidget {
  const TestGenerateInterviewScreen({super.key});

  @override
  State<TestGenerateInterviewScreen> createState() =>
      _TestGenerateInterviewScreenState();
}

class _TestGenerateInterviewScreenState
    extends State<TestGenerateInterviewScreen> {
  String _resultText = 'لسه مفيش نتيجة';
  bool _isLoading = false;

  Future<void> _testFunction() async {
    setState(() {
      _isLoading = true;
      _resultText = 'جاري الاختبار...';
    });

    try {
      // 1. تأكد إن فيه مستخدم مسجل دخول
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // لو مفيش، سجل دخول anonymous مؤقتًا للاختبار بس
        final credential = await FirebaseAuth.instance.signInAnonymously();
        user = credential.user;
        debugPrint('تم تسجيل دخول مؤقت: ${user?.uid}');
      } else {
        debugPrint('مستخدم مسجل دخول بالفعل: ${user.uid}');
      }

      // 2. نادي على الـ Cloud Function
      final callable =
          FirebaseFunctions.instance.httpsCallable('generateInterview');

      final result = await callable.call({
        'trackTitle': 'Flutter',
        'technologyTitle': null,
        'experience': 'junior',
        'interviewType': 'technical',
        'difficulty': 'medium',
        'jobDescription': null,
      });

      debugPrint('=== نتيجة الدالة ===');
      debugPrint(result.data.toString());

      setState(() {
        _resultText = result.data.toString();
      });
    } on FirebaseFunctionsException catch (e) {
      // ده error راجع من الـ Cloud Function نفسها (زي HttpsError اللي كتبناها)
      debugPrint('FirebaseFunctionsException: ${e.code} - ${e.message}');
      setState(() {
        _resultText = 'خطأ من الدالة:\nCode: ${e.code}\nMessage: ${e.message}';
      });
    } catch (e) {
      debugPrint('خطأ عام: $e');
      setState(() {
        _resultText = 'خطأ عام: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختبار Cloud Function')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _testFunction,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('اختبار generateInterview'),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_resultText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}