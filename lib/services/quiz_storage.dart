// import 'package:cloud_firestore/cloud_firestore.dart';

// class QuizDataStorage {
//   static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   static Future<void> saveQuiz(String code, List<Map<String, dynamic>> quizData) async {
//     try {
//       await _firestore.collection('quizzes').doc(code).set({
//         'data': quizData,
//       });
//     } catch (e) {
//       print('Error saving quiz: $e');
//     }
//   }

//   static Future<List<Map<String, dynamic>>?> getQuiz(String code) async {
//     try {
//       final doc = await _firestore.collection('quizzes').doc(code).get();
//       if (doc.exists) {
//         final data = doc.data()?['data'] as List<dynamic>;
//         return data.map((e) => e as Map<String, dynamic>).toList();
//       }
//     } catch (e) {
//       print('Error fetching quiz: $e');
//     }
//     return null;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class QuizDataStorage {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> saveQuiz(String code, List<Map<String, dynamic>> quizData) async {
    try {
      await _firestore.collection('quizzes').doc(code).set({
        'data': quizData,
      });
    } catch (e) {
      print('Error saving quiz: $e');
    }
  }

  static Future<List<Map<String, dynamic>>?> getQuiz(String code) async {
    try {
      final doc = await _firestore.collection('quizzes').doc(code).get();
      if (doc.exists) {
        final data = doc.data()?['data'] as List<dynamic>?;
        if (data != null) {
          return data.map((e) => e as Map<String, dynamic>).toList();
        } else {
          print('No quiz data found for the provided code.');
        }
      }
    } catch (e) {
      print('Error fetching quiz: $e');
    }
    return null;
  }
}
