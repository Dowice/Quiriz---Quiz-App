// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:share_plus/share_plus.dart';

// class QuizCodePage extends StatelessWidget {
//   final String quizCode;

//   const QuizCodePage({super.key, required this.quizCode});

//   void _shareQuizCode() {
//   final String message = 'Check out this quiz I created! Use the code $quizCode to access it.';
//   print('Sharing message: $message'); // Log message to debug
//   Share.share(message, subject: 'Quiz Code');
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: Text(
//           'Quiz Code',
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Your Quiz Code',
//                 style: GoogleFonts.poppins(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               Text(
//                 quizCode,
//                 style: GoogleFonts.poppins(
//                   fontSize: 36,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white, // Color for better visibility
//                 ),
//               ),
//               const SizedBox(height: 24.0),
//               ElevatedButton(
//                 onPressed: _shareQuizCode,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 child: Text(
//                   'Share Code',
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Navigate back to the previous screen
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 child: Text(
//                   'Go Back',
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiriz/screens/create_page.dart';
import 'package:share_plus/share_plus.dart';
import 'quiz_creator.dart'; // Import the QuizCreatorPage

class QuizCodePage extends StatelessWidget {
  final String quizCode;

  const QuizCodePage({super.key, required this.quizCode});

  void _shareQuizCode() {
    final String message = 'Check out this quiz I created! Use the code $quizCode to access it.';
    print('Sharing message: $message'); // Log message to debug
    Share.share(message, subject: 'Quiz Code');
  }

  @override
  Widget build(BuildContext context) {
    // Define colors from the Coolors palette
    final Color pastelPeach = Color(0xFFEFD9CE); // Pastel peach
    final Color lavender = Color(0xFFDEC0F1);    // Lavender
    final Color lightPurple = Color(0xFFB79CED); // Light purple
    final Color softPurple = Color(0xFF957FEF);  // Soft purple
    final Color brightPurple = Color(0xFF7161EF); // Bright purple

    return Scaffold(
      appBar: AppBar(
        backgroundColor: brightPurple,
        title: Text(
          'Quiz Code',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your Quiz Code',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: brightPurple,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                quizCode,
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Better visibility against the background
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _shareQuizCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: softPurple,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Share Code',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Homescreen(), // Navigate back to QuizCreatorPage
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightPurple,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Go Back',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
