import 'package:flutter/material.dart';
import '../services/auth_serives.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController(); // For OTP

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                AuthService.signInWithEmail(email, password, context);
              },
              child: Text("Login"),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            ElevatedButton(
              onPressed: () async {
                final phone = phoneController.text;
                await AuthService.signInWithOTP(phone, context);
              },
              child: Text("Login with OTP"),
            ),
            ElevatedButton(
              onPressed: () => AuthService.signInWithGoogle(context),
              child: Text("Sign in with Google"),
            ),
            ElevatedButton(
              onPressed: () => AuthService.signInWithGitHub(context),
              child: Text("Sign in with GitHub"),
            ),
          ],
        ),
      ),
    );
  }
}
