import 'package:flutter/material.dart';
import 'be_sign_up.dart';
import 'sign_in_srcreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreen_state createState() => SignUpScreen_state();
}

class SignUpScreen_state extends State<SignUpScreen> {
  final email_controller = new TextEditingController();
  final password_controller = new TextEditingController();
  final check_password_controller = new TextEditingController();
  String email = "";
  String password = "";
  String check_password = "";

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
              'Sign Up',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Create an Account',
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
            const SizedBox(height: 25),
            TextFormField(
              controller: check_password_controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12)),
                hintText: 'Confirm Password',
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text('Already have an account'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignInScreen()));
                    },
                    child: const Text('Login')),
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
                  check_password = check_password_controller.text;
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => backend_sign_up(
                          email: email, password: password, check_password: check_password,)));
                },
                child: const Text(
                  'Sign Up',
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
