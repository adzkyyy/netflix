import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:netflix/screen/homeScreen.dart';
import 'package:netflix/screen/loginScreen.dart';

class AnimLoginLogout extends StatelessWidget {

  const AnimLoginLogout ({Key key}) : super (key: key);

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const AnimLoginLogout(),
  );


  @override
  Widget build(BuildContext context) {
    final user = context.watchSignedInUser();
    user.map(
      (value) => {_navigateToHomeScreen(context)}, 
      empty: (_) => {_navigateToLoginScreen(context)}, 
      initializing: (_) {},
    );

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _navigateToLoginScreen(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Navigator.of(context).pushReplacement(LoginScreen.route),
    );
  }

  void _navigateToHomeScreen(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Navigator.of(context).pushReplacement(HomeScreen.route),
    );
  }
}
