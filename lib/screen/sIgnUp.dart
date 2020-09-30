import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:netflix/models/loginTitle.dart';
import 'package:netflix/models/styleTextField.dart';
import 'package:netflix/widget/bgColor.dart';
import 'package:netflix/widget/indicatorSign.dart';

class SignUp extends StatelessWidget {

  const SignUp (
    {
      Key key,
      this.onSignInPressed,
    }
  );
  
  final VoidCallback onSignInPressed;

  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.isSubmitting();
    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Buat Akunmu\nDisini'
                )
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: EmailTextFormField(
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      decoration: registerInputDecoration(hintText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: PasswordTextFormField(
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      decoration: registerInputDecoration(hintText: 'Password'),
                    ),
                  ),
                  IndicatorSignUp(
                    label: 'Sign Up', 
                    isLoading: isSubmitting, 
                    onPressed: () {
                    context.registerWithEmailAndPassword();
                    }
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){
                        onSignInPressed?.call();
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}