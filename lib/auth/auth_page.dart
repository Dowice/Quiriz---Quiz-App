// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({super.key});

//   @override
//   _AuthPageState createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isSignUp = false; // Toggle between Sign Up and Sign In
//   bool _isLoading = false;

//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<void> _submit() async {
//     final email = _emailController.text;
//     final password = _passwordController.text;

//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill out all fields.')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       if (_isSignUp) {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//       } else {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//       }
//       Navigator.pushReplacementNamed(context, '/homescreen');
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> _signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         // User canceled the sign-in
//         return;
//       }

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

//       if (userCredential.user != null) {
//         Navigator.pushReplacementNamed(context, '/homescreen');
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error signing in with Google: $e')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Color lightPurple = Color(0xFFB79CED); // Light purple
//     final Color softPurple = Color(0xFF957FEF); // Soft purple
//     final Color googleButtonColor = Color(0xFF7161EF); // Color for Google Sign-In button

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           _isSignUp ? 'Sign Up' : 'Sign In',
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: softPurple,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//                 filled: true,
//                 fillColor: Colors.white.withOpacity(0.8),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//                 filled: true,
//                 fillColor: Colors.white.withOpacity(0.8),
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 24),
//             if (!_isSignUp) ...[
//               ElevatedButton(
//                 onPressed: _signInWithGoogle,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: googleButtonColor, // Set the button color
//                   padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SvgPicture.asset(
//                       'assets/images/google_logo.svg', // Add a Google logo image
//                       height: 24,
//                       width: 24,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       'Sign In with Google',
//                       style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//             ],
//             ElevatedButton(
//               onPressed: _isLoading ? null : _submit,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: softPurple,
//                 padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//               ),
//               child: _isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : Text(
//                       _isSignUp ? 'Sign Up' : 'Sign In',
//                       style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
//                     ),
//             ),
//             const SizedBox(height: 16),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _isSignUp = !_isSignUp;
//                 });
//               },
//               child: Text(
//                 _isSignUp ? 'Already have an account? Sign In' : 'Don’t have an account? Sign Up',
//                 style: GoogleFonts.poppins(color: softPurple),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSignUp = false; // Toggle between Sign Up and Sign In
  bool _isLoading = false;
  bool _rememberMe = false; // Remember me functionality

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  Future<void> _submit() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;

    if (email.isEmpty || password.isEmpty || (_isSignUp && name.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      if (_isSignUp) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await FirebaseAuth.instance.currentUser?.updateProfile(displayName: name);
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      Navigator.pushReplacementNamed(context, '/homescreen');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, '/homescreen');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in with Google: $e')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF6F35A5); // Primary color
    final Color secondaryColor = Color(0xFFDDC2F1); // Light gradient color
    final Color buttonColor = Color(0xFF6F35A5); // Button color

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isSignUp ? 'Create Account' : 'Sign In',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildForm(),
                  const SizedBox(height: 24),
                  if (!_isSignUp)
                    ElevatedButton(
                      onPressed: _signInWithGoogle,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 5,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("assets/images/google_logo.svg",
                          height: 24,
                          width: 24),
                          const SizedBox(width: 8),
                          Text(
                            'Sign In with Google',
                            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            _isSignUp ? 'Sign Up' : 'Sign In',
                            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                          ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                      const Text('Remember Me', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isSignUp = !_isSignUp;
                      });
                    },
                    child: Text(
                      _isSignUp ? 'Already have an account? Sign In' : 'Don’t have an account? Sign Up',
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reset-password');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        if (_isSignUp) ...[
          _buildTextField(
            controller: _nameController,
            label: 'Name',
            obscureText: false,
          ),
          const SizedBox(height: 16),
        ],
        _buildTextField(
          controller: _emailController,
          label: 'Email',
          obscureText: false,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _passwordController,
          label: 'Password',
          obscureText: true,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
