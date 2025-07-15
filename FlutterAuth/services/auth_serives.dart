// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static Future<void> loginUser(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      // ignore: avoid_print
      print("Email or password is empty.");
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      // ignore: avoid_print
      print("Login successful!");
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print("Firebase Auth error: ${e.code} - ${e.message}");
    } catch (e) {
      // ignore: avoid_print
      print("Unexpected error: $e");
    }
  }

  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        // Web: Use signInWithPopup for Google
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        await FirebaseAuth.instance.signInWithPopup(googleProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Google Sign-In (Web) successful!')),
        );
      } else {
        // Native: Use google_sign_in package
        await GoogleSignIn().signOut();
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) return;
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Google Sign-In successful!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Google Sign-In failed: $e')));
    }
  }

  static Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  static void signInWithEmail(
    String email,
    String password,
    BuildContext context,
  ) {}

  static Future<void> signInWithOTP(String phone, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Phone Auth successful!')));
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Phone Auth failed: \\${e.message}')),
        );
      },
      codeSent: (String verificationId, int? resendToken) async {
        // In production, prompt user for the SMS code and sign in
        String smsCode = await _getSmsCodeFromUser(context);
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Phone Auth successful!')));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static Future<String> _getSmsCodeFromUser(BuildContext context) async {
    String smsCode = '';
    await showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: Text('Enter SMS Code'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                smsCode = controller.text;
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    return smsCode;
  }

  static Future<void> signInWithGitHub(BuildContext context) async {
    try {
      if (kIsWeb) {
        GithubAuthProvider githubProvider = GithubAuthProvider();
        await FirebaseAuth.instance.signInWithPopup(githubProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('GitHub Sign-In (Web) successful!')),
        );
      } else {
        GithubAuthProvider githubProvider = GithubAuthProvider();
        await FirebaseAuth.instance.signInWithProvider(githubProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('GitHub Sign-In successful!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('GitHub Sign-In failed: $e')));
    }
  }
}
