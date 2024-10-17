import 'package:chat_flutter/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  var _db = FirebaseFirestore.instance;

  postFeedback(String message) async {
    User user = await FirebaseAuthService().checkUser();

    await _db.collection("Feedbacks").add({
      "user": user.displayName,
      "message": message,
      "photo": "",
      "created_at": DateTime.now()
    });
  }

  getFeedback() async {
    var feedbacks = await _db
        .collection("Feedbacks")
        .orderBy("created_at", descending: true)
        .get();
    return feedbacks.docs;
  }
}
