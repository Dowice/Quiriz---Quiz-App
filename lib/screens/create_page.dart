// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:quiriz/quiz_creator.dart';
// import 'quiz_storage.dart';
// import 'quiz_page.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   final TextEditingController _quizCodeController = TextEditingController();
//   bool _isLoading = false; // State to manage loading indicator

//   Future<void> _handleSubmit() async {
//     final quizCode = _quizCodeController.text;

//     if (quizCode.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enter a quiz code.'),
//         ),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true; // Start loading
//     });

//     try {
//       final quizData = await QuizDataStorage.getQuiz(quizCode); // Await quiz data

//       if (quizData == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Invalid quiz code.'),
//           ),
//         );
//       } else {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => QuizPage(quizCode: quizCode),
//           ),
//         );
//       }
//     } catch (e) {
//       // Handle error
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('An error occurred: $e'),
//         ),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false; // Stop loading
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _quizCodeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Qwiriz',
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Create Quiz Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const QuizCreatorPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               child: Text(
//                 "Create Quiz",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             // Quiz Code TextField
//             TextField(
//               controller: _quizCodeController,
//               decoration: InputDecoration(
//                 hintText: 'Enter Quiz Code',
//                 hintStyle: GoogleFonts.poppins(
//                   color: Colors.grey[600],
//                   fontWeight: FontWeight.normal,
//                 ),
//                 labelText: 'Quiz Code',
//                 labelStyle: GoogleFonts.poppins(
//                   color: Colors.deepPurple,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Submit Button with Loading Indicator
//             ElevatedButton(
//               onPressed: _isLoading ? null : _handleSubmit, // Disable button if loading
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: _isLoading ? Colors.grey : Colors.deepPurple,
//                 padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               child: _isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : Text(
//                       "Submit",
//                       style: GoogleFonts.poppins(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiriz/screens/quiz_creator.dart';
import '../services/quiz_storage.dart';
import 'quiz_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _quizCodeController = TextEditingController();
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward(); // Start the animation
  }

  Future<void> _handleSubmit() async {
    final quizCode = _quizCodeController.text;

    if (quizCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a quiz code.'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final quizData = await QuizDataStorage.getQuiz(quizCode);

      if (quizData == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid quiz code.'),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizPage(quizCode: quizCode),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _quizCodeController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/authPage');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Color(0xFF6F35A5); // Matching AuthPage button color
    final Color secondaryColor = Color(0xFFDDC2F1); // Matching AuthPage secondary color

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qwiriz',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: buttonColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.account_circle_outlined),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [buttonColor, secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 120,
                    width: 120,
                  ),
                ),
                const SizedBox(height: 40),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizCreatorPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor, // Set button color
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      "Create Quiz",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: TextField(
                    controller: _quizCodeController,
                    decoration: InputDecoration(
                      labelText: 'Quiz Code',
                      labelStyle: GoogleFonts.poppins(
                        color: buttonColor,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor, width: 2.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor, // Set button color
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Submit",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
