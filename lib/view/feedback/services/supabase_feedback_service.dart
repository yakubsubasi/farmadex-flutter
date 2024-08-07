import 'package:farmadex/view/authentication/data/firebase_auth_repository.dart';

import 'package:farmadex/view/feedback/models/feedback.dart';
import 'package:farmadex/view/feedback/services/fast_feedback_service.dart';
import 'package:farmadex/view/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase Firestore import

part 'supabase_feedback_service.g.dart';

class FirebaseFeedbackService extends FastFeedbackService {
  final String userId;

  FirebaseFeedbackService(this.userId);

  FirebaseFirestore get _firebase => FirebaseFirestore.instance;

  @override
  Future<List<Feedback>> getLatestFeedback() async {
    QuerySnapshot response = await _firebase
        .collection('feedback')
        .orderBy('created_at', descending: true)
        .limit(10)
        .get();

    if (response.docs.isEmpty) return [];
    return response.docs
        .map((e) => Feedback.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> submitFeedback(String feedback, FeedbackType type) async {
    _firebase.collection('feedback').add(Feedback(
          userId: userId,
          createdAt: DateTime.now(),
          message: feedback,
          type: type,
        ).toJson());
  }
}

@riverpod
FirebaseFeedbackService feedbackService(FeedbackServiceRef ref) {
  final String id = ref.read(authRepositoryProvider).currentUser!.uid;
  return FirebaseFeedbackService(id);
}
