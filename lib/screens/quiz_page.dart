// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'quiz_storage.dart';
// import 'quiz_results_page.dart';

// class QuizPage extends StatefulWidget {
//   final String quizCode;

//   const QuizPage({super.key, required this.quizCode});

//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   late Future<List<Map<String, dynamic>>?> _quizFuture;
//   List<int?> _selectedAnswers = [];

//   @override
//   void initState() {
//     super.initState();
//     _quizFuture = QuizDataStorage.getQuiz(widget.quizCode);
//     _quizFuture.then((quizData) {
//       if (quizData != null && mounted) {
//         setState(() {
//           _selectedAnswers = List<int?>.filled(quizData.length, null);
//         });
//       }
//     }).catchError((error) {
//       // Handle error when fetching quiz data
//       print('Error fetching quiz data: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to load quiz data')),
//       );
//     });
//   }

//   void _handleSubmit() {
//     _quizFuture.then((quizData) {
//       if (quizData != null) {
//         int score = 0;
//         for (int i = 0; i < quizData.length; i++) {
//           if (_selectedAnswers[i] == quizData[i]['correctAnswerIndex']) {
//             score++;
//           }
//         }
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => QuizResultPage(
//               score: score,
//               totalQuestions: quizData.length,
//             ),
//           ),
//         );
//       }
//     }).catchError((error) {
//       // Handle error when submitting quiz
//       print('Error submitting quiz: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to submit quiz')),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Take Quiz',
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//         elevation: 0,
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>?>(
//         future: _quizFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError ||
//               !snapshot.hasData ||
//               snapshot.data == null) {
//             return const Center(child: Text('Error loading quiz'));
//           } else {
//             final quizData = snapshot.data!;
//             return Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: List.generate(quizData.length, (questionIndex) {
//                     final question = quizData[questionIndex];
//                     final answers = (question['answers'] as List<dynamic>)
//                         .map((e) => e as String)
//                         .toList(); // Ensure it's a List<String>

//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 24.0),
//                       padding: const EdgeInsets.all(16.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 2,
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             'Question ${questionIndex + 1}',
//                             style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.deepPurple,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                           Text(
//                             question['question'] as String,
//                             style: GoogleFonts.poppins(
//                               fontSize: 16,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 16.0),
//                           ...List.generate(answers.length, (answerIndex) {
//                             return RadioListTile<int>(
//                               title: Text(
//                                   'Answer ${answerIndex + 1}: ${answers[answerIndex]}'),
//                               value: answerIndex,
//                               groupValue: _selectedAnswers[questionIndex],
//                               onChanged: (value) {
//                                 setState(() {
//                                   _selectedAnswers[questionIndex] = value;
//                                 });
//                               },
//                               activeColor: Colors.deepPurple,
//                             );
//                           }),
//                         ],
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _handleSubmit,
//         backgroundColor: Colors.deepPurple,
//         child: const Icon(Icons.check),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/quiz_storage.dart';
import 'quiz_results_page.dart';

class QuizPage extends StatefulWidget {
  final String quizCode;

  const QuizPage({super.key, required this.quizCode});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Future<List<Map<String, dynamic>>?> _quizFuture;
  List<int?> _selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    _quizFuture = QuizDataStorage.getQuiz(widget.quizCode);
    _quizFuture.then((quizData) {
      if (quizData != null && mounted) {
        setState(() {
          _selectedAnswers = List<int?>.filled(quizData.length, null);
        });
      }
    }).catchError((error) {
      print('Error fetching quiz data: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load quiz data')),
      );
    });
  }

  void _handleSubmit() {
    _quizFuture.then((quizData) {
      if (quizData != null) {
        int score = 0;
        for (int i = 0; i < quizData.length; i++) {
          if (_selectedAnswers[i] == quizData[i]['correctAnswerIndex']) {
            score++;
          }
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultPage(
              score: score,
              totalQuestions: quizData.length,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Quiz data is not available')),
        );
      }
    }).catchError((error) {
      print('Error submitting quiz: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit quiz: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF6F35A5); // Primary color
    final Color secondaryColor = Color(0xFFDDC2F1); // Light gradient color

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Time!',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>?>(
        future: _quizFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Error loading quiz'));
          } else {
            final quizData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(quizData.length, (questionIndex) {
                    final question = quizData[questionIndex];
                    final answers = (question['answers'] as List<dynamic>)
                        .map((e) => e as String)
                        .toList();

                    return Container(
                      margin: const EdgeInsets.only(bottom: 24.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Question ${questionIndex + 1}',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            question['question'] as String,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ...List.generate(answers.length, (answerIndex) {
                            return RadioListTile<int>(
                              title: Text(
                                  'Answer ${answerIndex + 1}: ${answers[answerIndex]}'),
                              value: answerIndex,
                              groupValue: _selectedAnswers[questionIndex],
                              onChanged: (value) {
                                setState(() {
                                  _selectedAnswers[questionIndex] = value;
                                });
                              },
                              activeColor: primaryColor,
                              tileColor: Colors.grey[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: const EdgeInsets.all(16.0),
                            );
                          }),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleSubmit,
        backgroundColor: primaryColor,
        child: const Icon(Icons.check),
      ),
    );
  }
}
