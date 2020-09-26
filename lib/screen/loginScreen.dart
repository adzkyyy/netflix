import 'package:flutter/material.dart';
import 'package:netflix/backgound/loginBackground.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen ({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundLogin(),
            ),
          ),
        ],
      ),
    );
  }
}