import 'package:flutter/material.dart';
import 'be_sign_in.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreen_state createState() => SignInScreen_state();
}

class SignInScreen_state extends State<SignInScreen> {
  final email_controller = new TextEditingController();
  final password_controller = new TextEditingController();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            const Spacer(),
            TextFormField(
              controller: email_controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12)),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: password_controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12)),
                hintText: 'Password',
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text('Don\'t have an account'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignUpScreen()));
                    },
                    child: const Text('Sign Up')),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              // height: getProportionateScreenHeight(56),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  backgroundColor: Colors.lightBlue,
                ),
                onPressed: () {
                  email = email_controller.text;
                  password = password_controller.text;
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => backend_sign_in(
                      email: email, password: password,)));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
