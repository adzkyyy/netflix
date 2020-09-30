import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:netflix/models/loginTitle.dart';
import 'package:netflix/models/styleTextField.dart';
import 'package:netflix/widget/bgColor.dart';
import 'package:netflix/widget/indicatorSign.dart';

class SignIn extends StatelessWidget {

  const SignIn(
    {
      Key key,
      @required this.onRegisterClicked,
    }
  );

  final VoidCallback onRegisterClicked;

  @override
  Widget build(BuildContext context) {

    final isSubmitting  = context.isSubmitting();

    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
              alignment: Alignment.centerLeft,
              child: LoginTitle(
                title: "Welcome\nBack",
              ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: EmailTextFormField(
                      decoration: signInInputDecoration(hintText: 'Email')
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: PasswordTextFormField(
                      decoration: signInInputDecoration(hintText: 'Password')
                    ),
                  ),
                  IndicatorSignIn(
                    label: 'Masuk',
                    isLoading: isSubmitting,
                    onPressed: () {
                      context.signInWithEmailAndPassword();
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        onRegisterClicked?.call();
                      },
                      child: const Text(
                        'Buat Akun ?',
                        style: TextStyle(
                          fontSize: 16.0,
                          decoration: TextDecoration.underline,
                          color: BgColor.darkBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}