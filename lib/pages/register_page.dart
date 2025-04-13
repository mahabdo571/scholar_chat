import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  static String routeId = 'registerPage';
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Image.asset('assets/images/scholar.png'),
              const SizedBox(height: 20),
              const Text(
                'Scholar Chat',

                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: 'pacifico',
                ),
              ),
              Spacer(flex: 2),
              Row(
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: "Email",
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "Password",
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                title: "Register",
                onTap: () async {
                  var auth = FirebaseAuth.instance;
                  UserCredential user = await auth
                      .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );

                  print(user.user?.uid);
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'already have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      ' Login',
                      style: TextStyle(
                        color: Color(0xffc7ede6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
