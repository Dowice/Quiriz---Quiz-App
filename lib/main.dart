import 'package:flutter/material.dart';
import 'package:quiriz/screens/create_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiriz/screens/quiz_creator.dart';
import 'package:quiriz/auth/reset_password_page.dart';
import 'auth/auth_page.dart'; // Import the new AuthPage
// void main() {
//   runApp( MaterialApp(
//     home: const Homescreen(),
//     theme: ThemeData.dark(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qwiriz',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AuthPage(),
       routes: {
        '/authPage': (context) => const AuthPage(),
        '/homescreen': (context) => const Homescreen(),
        '/quizCreator': (context) => const QuizCreatorPage(),
        '/reset-password': (context) => const ResetPasswordPage(),
        // Add other routes here
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
