import 'package:chaat/screens/login_screen.dart';
import 'package:chaat/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chaat/components/buttons_welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
    void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 135,
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TypewriterAnimatedTextKit(
                    repeatForever: true,
                    speed: Duration(milliseconds: 250),
                    onTap: () {},
                    text: ['Enjoy your time!'],
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'robotoSerif', //TODO: Change font
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            ButtonsWelcomeScreen(
              colour: Colors.lightBlue,
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            ButtonsWelcomeScreen(
              colour: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
