import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';
import 'login.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<CustomSplashScreen> {
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    await FirebaseAuth.instance
        .currentUser()
        .timeout(Duration(seconds: 5))
        .then((user) {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(user: user),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
