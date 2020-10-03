import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:netflix/widget/animLoginLogout.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AnimLoginLogout(),
      ),
    );
  }
}