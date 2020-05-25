import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'util/request_pin_code.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double _height, _width, _fixedPadding;

  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _fixedPadding = _height * 0.025;

    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.lightBlueAccent])),
      child: Center(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: _getBody(),
            ),
          ),
        ),
      ),
    )));
  }

  Widget _getBody() => Card(
        color: Colors.transparent,
        borderOnForeground: true,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        child: Container(
            height: _height * 9 / 10,
            width: _width * 9 / 10,
            child: _getColumnBody()),
      );

  Widget _getColumnBody() => Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text('Flutter Project',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black45,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                        fontSize: 35,
                        fontWeight: FontWeight.w900)),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: _fixedPadding),
            child: subTitle('Enter your phone', _width * 0.04),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: _fixedPadding,
                right: _fixedPadding,
                bottom: _fixedPadding),
            child: phoneNumberField(_phoneNumberController),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(width: _fixedPadding),
              Icon(Icons.info, color: Colors.black, size: 20.0),
              SizedBox(width: 10.0),
              Expanded(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'We will send ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: 'One Time Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: ' to this mobile number',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                ])),
              ),
              SizedBox(width: _fixedPadding),
            ],
          ),
          SizedBox(height: _fixedPadding * 1.5),
          RaisedButton(
            elevation: 15.0,
            onPressed: () {
              startPhoneAuth();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'SEND OTP',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: _width * 0.045),
              ),
            ),
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ],
      );

  startPhoneAuth() {
    Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (BuildContext context) =>
            PinCodeVerificationScreen(_phoneNumberController.text)));
  }

  Widget phoneNumberField(TextEditingController controller) => Card(
        child: TextFormField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.phone,
          key: Key('EnterPhone-TextFormField'),
          decoration: InputDecoration(
            border: InputBorder.none,
            errorMaxLines: 1,
            prefix: Text("   "),
          ),
        ),
      );

  Widget subTitle(String text, double size) => Align(
      alignment: Alignment.centerLeft,
      child: Text(' $text',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: size)));
}
