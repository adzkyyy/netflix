import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:netflix/backgound/loginBackground.dart';
import 'package:netflix/screen/homeScreen.dart';
import 'package:netflix/screen/sIgnUp.dart';
import 'package:netflix/screen/signIn.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen ({Key key}): super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => LoginScreen(),);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> 
  with SingleTickerProviderStateMixin{

  AnimationController _controller;
  
  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: LitAuth.custom(
        onAuthSuccess: (){
          Navigator.of(context).pushReplacement(HomeScreen.route);
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: BackgroundLogin(
                  animation: _controller.view
                ),
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 800
                ),
                child: ValueListenableBuilder<bool>(
                  valueListenable: showSignInPage,
                  builder: (context, value, child) {
                    return SizedBox.expand(
                      child: PageTransitionSwitcher(
                        reverse: !value,
                        transitionBuilder: (child, animation, secondaryAnimation){
                          return SharedAxisTransition(
                            animation: animation, 
                            secondaryAnimation: secondaryAnimation, 
                            transitionType: SharedAxisTransitionType.vertical,
                            fillColor: Colors.transparent,
                            child: child,
                          );
                        },
                        child: value 
                        ? SignIn(
                          key: ValueKey('Sign In'),
                          onRegisterClicked: (){
                          context.resetSignInForm();
                          showSignInPage.value = false;
                          _controller.forward();
                          },
                        ) :
                         SignUp(
                          key: ValueKey('Sign Up'),
                          onSignInPressed: (){
                          context.resetSignInForm();
                          showSignInPage.value = true;
                          _controller.reverse();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}