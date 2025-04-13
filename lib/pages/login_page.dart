import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/helper/show_snackbar.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/register_page.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  static String routeId = 'loginPage';

  @override
  State<LoginPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 75),
                  Image.asset(kLogo, height: 100),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Scholar Chat',

                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 75),

                  Row(
                    children: [
                      const Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextFromField(
                    hintText: "Email",
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFromField(
                    hintText: "Password",
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: "Login",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        // formKey.currentState!.save();

                        try {
                          await loginUser(context);
                          Navigator.pushNamed(context, ChatPage.routeId);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(
                              context,
                              'No user found for that email.',
                              Colors.red,
                            );
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(
                              context,
                              'Wrong password provided for that user.',
                              Colors.red,
                            );
                          }
                        } catch (e) {
                          showSnackBar(context, e.toString(), Colors.red);
                        }
                        isLoading = false;
                        setState(() {});
                      } else {
                        return;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont\t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.routeId);
                        },
                        child: Text(
                          ' Register',
                          style: TextStyle(
                            color: Color(0xffc7ede6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    showSnackBar(context, 'User login Successfully', Colors.green[400]!);
  }
}
