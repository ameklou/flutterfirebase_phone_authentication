import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;

  Home({@required this.user});

  @override
  _AppHomeState createState() => _AppHomeState(user: this.user);
}

class _AppHomeState extends State<Home> with TickerProviderStateMixin<Home> {
  final FirebaseUser user;

  _AppHomeState({@required this.user});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello ' + user.phoneNumber,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
