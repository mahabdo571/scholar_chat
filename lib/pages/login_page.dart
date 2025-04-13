import 'package:flutter/material.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff2b475e),
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
                    'LOGIN',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(hintText: "Email"),
              const SizedBox(height: 10),
              CustomTextField(hintText: "Password"),
              const SizedBox(height: 20),
              CustomButton(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'dont\'t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    ' Sign Up',
                    style: TextStyle(
                      color: Color(0xffc7ede6),
                      fontWeight: FontWeight.bold,
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
